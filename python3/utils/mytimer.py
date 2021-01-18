import time


def timer(func, *args, **kwargs):
    repeat = kwargs.get('repeat', 1000)
    repeat_list = range(repeat)

    start = time.time()
    ret = None
    for i in repeat_list:
        ret = func(*args, **kwargs)

    elapsed = time.time() - start

    return ret, '{} ms'.format(round(elapsed * 1000, 3)), '{} repeats'.format(repeat)
