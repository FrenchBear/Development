# multiargs


def plus(*args, **kwargs):
    print(f"args: {args}")
    for item in args:
        print(item)


plus(1,2,3)
