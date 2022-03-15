HW_SOURCE_FILE=__file__


def pascal(row, column):
    """Returns a number corresponding to the value at that location
    in Pascal's Triangle.
    >>> pascal(0, 0)
    1
    >>> pascal(0, 5)	# Empty entry; outside of Pascal's Triangle
    0
    >>> pascal(3, 2)	# Row 4 (1 3 3 1), 3rd entry
    3
    """
    if column > row:
        return 0
    elif row == column:
        return 1
    elif column == 0:
        return 1
    else:
        return pascal(row - 1, column) + pascal(row - 1, column - 1)

def compose1(f, g):
    """"Return a function h, such that h(x) = f(g(x))."""
    def h(x):
        return f(g(x))
    return h

def repeated(f, n):
    """Return the function that computes the nth application of func (recursively!).

    >>> add_three = repeated(lambda x: x + 1, 3)
    >>> add_three(5)
    8
    >>> square = lambda x: x ** 2
    >>> repeated(square, 2)(5) # square(square(5))
    625
    >>> repeated(square, 4)(5) # square(square(square(square(5))))
    152587890625
    >>> repeated(square, 0)(5)
    5
    >>> from construct_check import check
    >>> # ban iteration
    >>> check(HW_SOURCE_FILE, 'repeated',
    ...       ['For', 'While'])
    True
    """
    def comp(x):
        return f(x)
    if n == 1:
        return comp
    else:
        return compose1(repeated(f, n - 1), comp)

def num_eights(x):
    """Returns the number of times 8 appears as a digit of x.

    >>> num_eights(3)
    0
    >>> num_eights(8)
    1
    >>> num_eights(88888888)
    8
    >>> num_eights(2638)
    1
    >>> num_eights(86380)
    2
    >>> num_eights(12345)
    0
    >>> from construct_check import check
    >>> # ban all assignment statements
    >>> check(HW_SOURCE_FILE, 'num_eights',
    ...       ['Assign', 'AugAssign'])
    True
    """
    def helper(x, n, cnt):
        if x == 0:
            return cnt
        elif x  % 10 == 8:
            cnt += 1
        return helper(x // 10, n + 1, cnt)
    
    return helper(x, 0, 0)


def pingpong(n):
    """Return the nth element of the ping-pong sequence.

    >>> pingpong(8)
    8
    >>> pingpong(10)
    6
    >>> pingpong(15)
    1
    >>> pingpong(21)
    -1
    >>> pingpong(22)
    -2
    >>> pingpong(30)
    -2
    >>> pingpong(68)
    0
    >>> pingpong(69)
    -1
    >>> pingpong(80)
    0
    >>> pingpong(81)
    1
    >>> pingpong(82)
    0
    >>> pingpong(100)
    -6
    >>> from construct_check import check
    >>> # ban assignment statements
    >>> check(HW_SOURCE_FILE, 'pingpong', ['Assign', 'AugAssign'])
    True
    """
    eights = {0:0}
    nums = {0:0}

    def put_eights(n, dest, cnt):
        if n > dest:
            return
        if cnt % 2 == 0:
            nums[n]  =  eights[list(eights)[-1]]  + (n - list(eights)[-1])
        else:
            nums[n]  = eights[list(eights)[-1]]  - (n - list(eights)[-1])
        if num_eights(n) > 0 or n % 8 == 0:
            cnt += 1
            eights[n] = nums[n]
        return put_eights(n + 1, dest, cnt)

    put_eights(1, n, 0)
    return nums[n]

