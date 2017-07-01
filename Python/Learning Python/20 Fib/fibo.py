# Example of module in Python
# 2015-07-26    PV


def fib(n):
    """Print a Fibonacci series up to n."""
    a, b = 0, 1
    while a <= n:
            print(a, end=' ')
            a, b = b, a + b
    print()


def fib2(n):
    """Returns a Fibonacci series as a list up to n.
    
    Well, just a simple example.
    """
    result = []
    a, b = 0, 1
    while a <= n:
            result.append(a)
            a, b = b, a + b
    return result



# When running this module from command line:
if __name__ == "__main__":
    import sys
    if len(sys.argv)!=2 or not sys.argv[1].isdigit():
        print("usage: fibo n")
        print(fib.__doc__)
        sys.exit()
    fib(int(sys.argv[1]))
