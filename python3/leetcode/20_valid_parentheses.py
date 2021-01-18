class Solution:
    def isValid(self, s):
        par_map = {
            '{': '}',
            '(': ')',
            '[': ']',
        }

        # opened = {'[':, '{', '(')
        # closed = (']', '}', ')')

        stack = []
        for ch in s:
            p = par_map.get(ch)
            if p:
                stack.append(p)
            else:
                try:
                    if ch == stack.pop():
                        continue
                    else:
                        return False
                except IndexError:
                    return False

        return True if not stack else False


print(Solution().isValid('()'))

