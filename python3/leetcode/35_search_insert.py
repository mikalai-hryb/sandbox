# class Solution:
#     def searchInsert(self, nums, target):
#         for i, curr in enumerate(nums):
#             if curr >= target:
#                 return i
#         return i+1

class Solution:
    def searchInsert(self, nums, target):
        l = 0
        r = len(nums)

        while l < r:
            mid = (l + r) // 2

            if target > nums[mid]:
                l = mid + 1
            else:
                r = mid
        return l

    def __str__(self):
        return self.__class__.__name__


# lst = [1, 3, 5, 7, 9, 11, 13, 15, 17]
# mes = [0, 1, 2, 3, 4, 5, 6, 7, 8]
# assert Solution().searchInsert([1, 3, 5, 6], 5) == 2, Solution().searchInsert([1, 3, 5, 6], 5)
# assert Solution().searchInsert([1, 3, 5, 6], 2) == 1, Solution().searchInsert([1, 3, 5, 6], 2)
# assert Solution().searchInsert([1, 3, 5, 6], 7) == 4, Solution().searchInsert([1, 3, 5, 6], 7)
# assert Solution().searchInsert([1], 0) == 0, Solution().searchInsert([1], 0)
# import time
import string
import random
N = 1000
r1 = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(N))
# r2 = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(N))
# r3 = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(N))
#
# a= time.time()
my_f = 'Aa'
my_super_list = [
    x + y + z
    for x in [] if True
    for y in []
    for z in []
    if x not in my_f and y not in my_f and z not in my_f
]
my_r = [(x, y) for x in range(5) if x % 2 == 0
               for y in range(5) if y % 2 == 1]
# t1 = time.time() - a
# print()
#
# u = time.time()
# k = []
# for x in r1:
# 	for y in r2:
# 		for z in r3:
# 			if x not in my_f and y not in my_f and z not in my_f:
# 				k.append(x + y + z)
# t2 = time.time() - u
# print((t2-t1)/t2)

M = [[1, 2, 3],
     [4, 5, 6],
     [7, 8, 9]]

import timeit
# r1 = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(N))
# r1 = timeit.timeit('[lambda line: line ** 2 for line in range(1000)]', number=10000)
# r2 = timeit.timeit('list(map(lambda line: line ** 2, range(1000)))', number=10000)

# print(r1)
# print(r2)

lst = [10,9,8,7,6]
def my_gen():
    c = 0
    while True:
        yield lst[c]
        c+=1
        if c ==3:
            return

# g = my_gen()
# print(my_gen)
# print(g)
# print(iter(g))
# print(next(g))
# print(g.__next__())
# print(next(g))
# lst = 'abcdef'
# print(next(g))
# # del lst
# print(next(g))
# zip()


# def myzip(*seqs):
#     seqs = [list(S) for S in seqs]
#     while all(seqs):
#         yield tuple(S.pop(0) for S in seqs)
#
# l = list(range(100000))
# m = myzip(l)
# import sys
# print(sys.getsizeof(myzip))
# print(sys.getsizeof(m))
# print(sys.getsizeof(l))
# print(next(m))
# print(next(m))
#
# print(sys.getsizeof(myzip))
# print(sys.getsizeof(m))
# del l
# print(next(m))

def myzip(*args):
    # you must cover map with list() because map returns the one-time iterable object
    # or you can get into an infinite loop

    iters = list(map(iter, args))
    while iters:
        res = [next(i) for i in iters]
        # res = list(next(i) for i in iters)  # does not work for some reason
        # res = tuple(next(i) for i in iters)  # does not work for some reason as well
        yield res  # if you want to return the tuple you have to cover 'res' with tuple()
a= 'abc'
b = 'bedee'
z = myzip(a, b)
print(list(z))

# r = []
# for i in range(10):
#     r.append(next(z))
# print(r)
#
#
# i1 = iter(a)
# i2 = iter(a)
# print(i1 is i2)
