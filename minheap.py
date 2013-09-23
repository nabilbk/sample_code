#What follows is a class for a heap data structure. A "min heap" is a binary tree where the value of each child of a node is at least at much as the value of the parent.
#Therefore, the smallest element in a heap is at the root. 
#The class contains functions to INITIALIZE, INSERT, and DELETE a root element from a heap.
#Giri Gopalan
#6/21/2012

import random

class minheap:	
	#Initialize an empty heap 
	def __init__(self):
		self.data = [] #elements of the heap are stored in an array, where the left child of node at index i is stored at index 2i, and the right child of index i is stored at 2i+1
		self.data.append(-100) #dummy value in the 0th slot of the array
		self.size = 0 #stores length of the array that stores heap. 
	#Insert element into a heap
	def add(self, x):
		self.data.append(x) #Insert element at the end of the list
		self.size += 1 #Increment the size of the heap
		index = self.size
		#While the parent of the newly inserted node is strictly greater than the child, transpose
		#parent and child to maintain the minheap property. Iterate this procedure until no minheap violations are encountered.
		while index > 1 and self.data[index/2] > self.data[index]: 
			temp = self.data[index/2]
			self.data[index/2] = self.data[index]
			self.data[index] = temp
			index = index/2
		return True	
	#Remove the root from a heap using an iterative procedure 
	def remove_root(self):
		i = 1
		nullify_index = 1
		while(2*i <= self.size):
			if 2*i == self.size:
				self.data[i] = self.data[2*i]
				self.data[2*i] = temp
				nullify_index = 2*i
				nullify_index = 2*i
				i += 1			
			elif self.data[2*i] != 'null' and self.data[2*i+1] != 'null':
				if self.data[2*i] < self.data[2*i+1]:
					temp =  self.data[i]
					self.data[i] = self.data[2*i]
					self.data[2*i] = temp
					nullify_index = 2*i
					i = 2*i				
				else:
					temp =  self.data[i]
					self.data[i] = self.data[2*i+1]
					self.data[2*i+1] = temp
					nullify_index = 2*i+1
					i = 2*i+1
			elif (self.data[2*i] != 'null'):
				temp =  self.data[i]
				self.data[i] = self.data[2*i]
				self.data[2*i] = temp
				nullify_index = 2*i
				i = 2*i
			elif (self.data[2*i+1] != 'null'):
				temp =  self.data[i]
				self.data[i] = self.data[2*i+1]
				self.data[2*i+1] = temp
				nullify_index = 2*i+1
				i = 2*i+1
			else:
				i = 2*i				
		root = self.data[nullify_index]
		self.data[nullify_index] = 'null'
		print self.data
		return root
	#Remove root from heap using recursion
	def remove_node(self, i):
		print i
		#removing a leaf
		if 2*i - 1 >= self.size: 
			temp = self.data[i]
			self.data[i] = 'null'
			return temp	
		elif self.data[2*i] != 'null' and self.data[2*i+1] != 'null':
			if self.data[2*i] < self.data[2*i+1]:
				temp =  self.data[i]
				self.data[i] = self.data[2*i]
				self.data[2*i] = temp
				return self.remove_node(2*i)
			else:
				temp =  self.data[i]
				self.data[i] = self.data[2*i+1]
				self.data[2*i+1] = temp
				return self.remove_node(2*i+1)
		elif (self.data[2*i] != 'null'):
			temp =  self.data[i]
			self.data[i] = self.data[2*i]
			self.data[2*i] = temp
			return self.remove_node(2*i)
		elif (self.data[2*i+1] != 'null'):
			temp =  self.data[i]
			self.data[i] = self.data[2*i+1]
			self.data[2*i+1] = temp
			return self.remove_node(2*i+1)
		else:
			temp = self.data[i]
			self.data[i] = 'null'
			return temp
			
				
#generate random numbers, add them to a heap, and then sort them by removing the root of the heap iteratively times.
test = minheap()
original = []
for i in range(36):
	r = random.randint(1,100)
	test.add(r)
	original.append(r)
test.data.append('null')
print original
print test.data
for i in range(36):
	test.remove_node(1)
print sorted(original)


				
			
		
		
