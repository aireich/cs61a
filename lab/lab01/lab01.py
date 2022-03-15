from tkinter.tix import Tree


def falling(n, k):
    """Compute the falling factorial of n to depth k.

    >>> falling(6, 3)  # 6 * 5 * 4
    120
    >>> falling(4, 3)  # 4 * 3 * 2
    24
    >>> falling(4, 1)  # 4
    4
    >>> falling(4, 0)
    1
    """
    result = 1
    cnt = 0
    while cnt < k:
        result = result * n
        n = n - 1
        cnt = cnt + 1
    return result



def sum_digits(y):
    """Sum all the digits of y.

    >>> sum_digits(10) # 1 + 0 = 1
    1
    >>> sum_digits(4224) # 4 + 2 + 2 + 4 = 12
    12
    >>> sum_digits(1234567890)
    45
    >>> a = sum_digits(123) # make sure that you are using return rather than print
    >>> a
    6
    """
    result = 0
    index  = 0
    while(pow(10, index) < y):
        result  = result + (y // pow(10, index)) % 10
        index += 1
    return result



def double_eights(n):
    """Return true if n has two eights in a row.
    >>> double_eights(8)
    False
    >>> double_eights(88)
    True
    >>> double_eights(2882)
    True
    >>> double_eights(880088)
    True
    >>> double_eights(12345)
    False
    >>> double_eights(80808080)
    False
    """
    found = False
    index = 0
    prev = False
    while found == False and pow(10, index) < n:
        current_digit = (n // pow(10, index)) %10
        index += 1
        if (current_digit == 8):
            found  = prev & True
            prev = True
    return found
        
