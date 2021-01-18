from typing import List
import time


class Solution:
    @staticmethod
    def twoSum(nums: List[int], target: int) -> List[int]:
        l = len(nums)
        for i in range(l):
            for k in range(i+1, l):
                if nums[i]+ nums[k] == target:
                    return [i, k]
                continue


class Solution2:
    @staticmethod
    def twoSum(nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        h = {}
        for i, num in enumerate(nums):
            n = target - num
            if n not in h:
                h[num] = i
            else:
                return [h[n], i]


NUMS = [2,7,11,15]
TARGET = 9

start = time.time()
end = time.time()

start = time.time()
Solution.twoSum(NUMS, TARGET)
end = time.time()
print(end - start)

start = time.time()
Solution2.twoSum(NUMS, TARGET)
end = time.time()
print(end - start)
