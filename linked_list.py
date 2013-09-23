#Practice code that implements a doubly linked list.
#Giri Gopalan
#7/3/2012

#Datum object contains a key, satellite data, next pointer, and previous pointer.
class datum:
	#Initialize an object without any satellite data
	def __init__(self,k,n,p):
		self.key = k
		self.next = n
		self.previous = p


#Dll object contains a doubly linked list, as well as functions to insert, delete, and search through it.
class dll:
	#Initialize a dll with the head of the list pointing to null
	def __init__(self):
		self.head = None
		self.tail = None
	
	#Insert into the dll, at the head of the list
	def insert(self, k):
		old_head = self.head
		self.head = datum(k,old_head,None)
		if old_head != None:
			old_head.previous = self.head
		else:
			self.tail = self.head
	
	#Search for an element from the dll with key k
	def search(self, k):
		cur = self.head
		if cur == None:
			return None
		else:
			while(cur != None):
				if cur.key == k:
					return cur
				cur = cur.next
		return None
	
	#Delete element with key k from dll
	def delete(self, k):
		#First search for the element in the list.
		n = self.search(k)
		#Case 1: the element to delete is not found in the list.
		if n == None:
			return None
		#Case 2: the element to delete is the first item in the list.
		elif n.previous == None:
			self.head = n.next
			n.next.previous = None
			if self.head == None:
				self.tail = None
			return n.key
		#Case 3: the element to delete is located at the end of the list.
		elif n.next == None:
			n.previous.next = n.next
			self.tail = n.previous
			return n.key
		#Case 4: the element to delete is located in the middle of the list.
		else:
			n.previous.next = n.next
			n.next.previous = n.previous
			return n.key
	
	#Iterate through the list and print out the keys stored:
	def iterate(self):
		cur = self.head
		while(cur != None):
			print cur.key
			cur = cur.next
		return True
	
	#Iterate through the list starting from the tail and print out the keys stores:
	def iterate_back(self):
		cur = self.tail
		while(cur != None):
			print cur.key
			cur = cur.previous
		return True
	
#Test out the data structure
test = dll()
for i in range(10):
	test.insert(i)

test.delete(9)
test.iterate_back()

			
			
		
	