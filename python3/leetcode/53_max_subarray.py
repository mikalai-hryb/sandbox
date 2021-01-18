class Solution:
    def maxSubArray(self, nums):
        overall_max = float('-inf')
        max_ending_here = 0

        for num in nums:
            if max_ending_here > 0:
                max_ending_here += num
            else:
                max_ending_here = num
            overall_max = max(overall_max, max_ending_here)

        return overall_max


f = Solution().maxSubArray


assert f([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6

