#What follows is code that implements the binary search tree data structure. A binary search tree
#is a rooted binary tree in which each node has a key such that all elements of its left subtree have a smaller key and all
#elements of the right subtree have a key that is greater.

#Giri Gopalan
#6/25/2012

#Node objects that are stored in the tree.
class node:
	def __init__(self):
		self = None

	def __init__(self, k, r, l, p):
		self.right = r
		self.left = l
		self.key = k
		self.parent = p

#Tree class 
class bst:
	def __init__(self):
		self.root = None
		
	#Accomplish an in order traversal of keys in the bst.
	def traverse(self):
		r = self.root
		return traverse_helper(r)	

	#Search the binary search tree for a node with key k.
	def search(self, k):
		if self.root == None:
			return None
		else:
			return search_helper(self.root, k)
							
	#Insert a new node into the bst. 
	def insert(self, k):
		#inserting into an empty tree
		if self.root == None:
			new = node(k, None, None, None)
			self.root = new
			return self
		else:
			if k <= self.root.key:
				if self.root.left == None:
					new = node(k, None, None, self.root)
					self.root.left = new
					return new
				else:
					return insert_helper(k, self.root.left)
			else:
				if self.root.right == None:
					new = node(k, None, None, self.root)
					self.root.right = new
					return new
				else:
					return insert_helper(k, self.root.right)
									
	#Delete a node with key k from the bst.
	def delete(self, k):
		cur = self.root
		if cur == None:
			return False
		else:
			while(cur != None):
				if k == cur.key:
					if cur.left != None:
						max = find_max(cur.left)
						cur.key = max.key
						p = max.parent 
						if p.right == max:
							p.right = max.left
						else:
							p.left = max.left
						return True
					elif cur.right != None:
						min = find_min(cur.right)
						cur.key = min.key
						p = min.parent 
						if p.right == min:
							p.right = min.right
						else:
							p.left = min.right
						return True
					else:
						p = cur.parent
						if p == None:
							self.root = None
						if cur == p.left:
							p.left = None
							return True
						else:
							p.right = None
							return True			
				elif k < cur.key:
					cur = cur.left
				else:
					cur = cur.right
			return False
										
#Recursive helper to insert a node.
def insert_helper(k, cur):
	if k <= cur.key:
		if cur.left == None:
			new = node(k, None, None, cur)
			cur.left = new
			return new
		else:
			return insert_helper(k, cur.left)
	else:
		if cur.right == None:
			new = node(k, None, None, cur)
			cur.right = new
			return new
		else:
			return insert_helper(k, cur.right)
#Recursive helper function to help with the traversal.
def traverse_helper(cur):
	if cur == None:
		return True
	else:
		traverse_helper(cur.left)
		print cur.key
		traverse_helper(cur.right)
		
#Find the minimum element in a subtree rooted at cur
def find_min(cur):
	min = cur
	while(cur.left != None):
		cur = cur.left
		if cur.key < min.key:
			min = cur
	return min

#Find the maximum element of a subtree rooted at cur
def find_max(cur):
	max = cur
	while(cur.right != None):
		cur = cur.right
		if cur.key > max.key:
			max = cur
	return max

#Recursive helper function to search for an element
def search_helper(cur, k):
	if cur.key == k:
		return cur
	elif cur.key <= k:
		if cur.key.left != None:
			return search_helper(cur.key.left,k)
		else:
			return None
	else:
		if cur.key.right != None:
			return search_helper(cur.key.right,k)
		else:
			return None