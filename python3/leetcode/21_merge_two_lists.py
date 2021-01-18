class ListNode:
	def __init__(self, val=0, next=None):
		self.val = val
		self.next = next

	def __str__(self):
		return '{}({})'.format(self.__class__.__name__, self.val)


class Solution:
	def mergeTwoLists(self, l1: ListNode, l2: ListNode) -> ListNode:
		org = l3 = ListNode(None)

		while l1 and l2:
			if l1.val < l2.val:
				l3.next = l1
				l1 = l1.next
			else:
				l3.next = l2
				l2 = l2.next
			l3 = l3.next

		l3.next = l1 or l2
		return org.next


def list_node_to_list(list_node):
	lst = []
	while list_node:
		lst.append(list_node.val)
		list_node = list_node.next
	return lst


l1 = ListNode(val=0, next=ListNode(val=3, next=ListNode(val=5)))
l2 = ListNode(val=0, next=ListNode(val=3))
# l2 = ListNode(val=2, next=ListNode(val=4))
tmp3 = ListNode(val=0, next=ListNode(val=0, next=ListNode(val=3, next=ListNode(val=3, next=ListNode(5)))))


l3 = Solution().mergeTwoLists(l1, l2)
assert list_node_to_list(tmp3) == list_node_to_list(l3), (list_node_to_list(tmp3), list_node_to_list(l3))

