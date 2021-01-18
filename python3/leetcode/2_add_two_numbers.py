import time


# Definition for singly-linked list.

class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def addTwoNumbers(self, l1, l2):
        first, second = l1, l2
        tmp = ListNode()
        third = tmp

        while first.val:
            s = first.val + second.val + tmp.val

            tmp.val = s % 10
            tmp.next = ListNode(s // 10)

            first, second, tmp = first.next, second.next, tmp.next

        return third


L3 = ListNode(3)
L2 = ListNode(4)
L2.next = L3
L1 = ListNode(2)
L1.next = L2

K3 = ListNode(4)
K2 = ListNode(6)
K2.next = K3
K1 = ListNode(5)
K1.next = K2


start = time.time()
end = time.time()

start = time.time()
a= Solution().addTwoNumbers(L1, K1)
end = time.time()
print(end - start)

print(a.val)
print(a.next.val)
