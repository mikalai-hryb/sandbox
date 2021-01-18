class Solution:
    def climbStairs(self, n):
        return Solution._climb_stairs(0, n)

    @staticmethod
    def _climb_stairs(curr_step, n):
        if curr_step > n:
            return 0
        if curr_step == n:
            return 1
        return Solution._climb_stairs(curr_step + 1, n) + Solution._climb_stairs(curr_step + 2, n)

    def climbStairs2(self, n):
        memo = [0] * n
        return Solution._climb_stairs2(0, n, memo)

    @staticmethod
    def _climb_stairs2(curr_step, n, memo):
        if curr_step > n:
            return 0
        if curr_step == n:
            return 1

        memo_step = memo[curr_step]
        if memo_step > 0:
            return memo_step

        node_value = (Solution._climb_stairs2(curr_step + 1, n, memo) +
                      Solution._climb_stairs2(curr_step + 2, n, memo))

        memo[curr_step] = node_value
        return node_value


a = Solution().climbStairs
b = Solution().climbStairs2


assert a(1) == 1
assert a(2) == 2
assert a(3) == 3
assert a(4) == 5

assert b(1) == 1
assert b(2) == 2
assert b(3) == 3
assert b(4) == 5