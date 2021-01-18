from utils.mytimer import timer

class Solution:
    def countAndSay(self, n):
        def f(s):
            ch = s[0]
            c = 0
            r = []

            for i in s:
                if i == ch:
                    c += 1
                else:
                    r.append('{}{}'.format(c, ch))
                    ch = i
                    c = 1
            r.append('{}{}'.format(c, ch))
            return ''.join(r)

        r = '1'
        for i in range(n-1):
            r = f(r)

        return r

    def countAndSay2(self, n):
        def f(s):
            ch = s[0]
            c = 0
            r = []

            for i in s:
                if i == ch:
                    c += 1
                else:
                    r.append(str(c))
                    r.append(ch)
                    ch = i
                    c = 1
            r.append(str(c))
            r.append(ch)
            return r

        r = ['1']
        for i in range(n-1):
            r = f(r)

        return ''.join(r)

    def countAndSay3(self, n):
        r = [1]

        for _ in range(n-1):
            next_r = []
            for i in r:
                if not next_r or next_r[-1] != i:
                    next_r.append(1)
                    next_r.append(i)
                else:
                    next_r[-2] += 1
            r = next_r

        return ''.join(map(str, r))


r = Solution().countAndSay3(4)
print(r)


print(timer(Solution().countAndSay3, 4))