class Solution:
    def removeElement(self, nums, val):
        l = len(nums)
        v = 0

        for i in range(l - 1, -1, -1):
            if nums[i] == val:
                l -= 1
                del nums[i]

        return l
lst = [0,1,2,2,3,0,4,2]
r = Solution().removeElement(lst, 2)



