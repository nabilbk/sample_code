#Practice code that implements Dijkstra's algorithm to find the shortest distance between two nodes in a weighted directed graph. 
#Giri Gopalan
#6-28-2012

#Shortest path calculates the shortest distance between nodes x and y. 
#Input: Adjacency matrix A, M is a distance matrix which contains the minimum distance between nodes
#       i and j, and nodes x and y are the nodes were trying to compute the minimum distance between, n is the number of nodes in the
#		graph.
#Output: The minimum distance between nodes x and y.
class graph:
	#for now, we will populate the graph with a dummy adjacency and distance matrix. In the future, we might have the option to load an arbitrary
	#graph via a text file or by other means
	def __init__(self):
		self.A = [[float('inf'),10,5,float('inf'),float('inf')],[float('inf'),float('inf'),2,1,float('inf')],[float('inf'),3,float('inf'),9,2],[float('inf'),float('inf'),float('inf'),float('inf'),4],[float('inf'),float('inf'),float('inf'),6,float('inf')]]
		self.M = [[0,float('inf'),5,float('inf'),float('inf')],[float('inf'),0,float('inf'),1,float('inf')],[float('inf'),float('inf'),0,float('inf'),2],[float('inf'),float('inf'),0,float('inf'),4],[float('inf'),float('inf'),float('inf'),6,0]]
		self.n = 5

	#compute the distance of the shortest path between x and y using Dijkstra's algorithm
	def Dijkstra(self,x,y):
		spaths = self.A[x] #initialize the shortest paths vector to the appropriate row in the adj. matrix
		visited = [] 
		for i in range(len(spaths)):
			visited.append(False) #initialize a vector to keep track of all nodes visited
		visited[x] = True #start at the initial node
		#iterate the following while there are still nodes to visit...
		while False in visited:
			min = float('inf')
			#determine which unvisited node has the smallest shortest path
			for i in range(len(visited)):
				if visited[i] == False and spaths[i] < min:
					min_ind = i
					min = spaths[min_ind]			
			#visit that node
			visited[min_ind] = True
			a = self.adjacents(min_ind)
			#update the shortest paths vector if there are shorter paths going through min_ind
			for i in range(len(a)):
				if self.A[min_ind][a[i]]+spaths[min_ind] < spaths[a[i]]:
					spaths[a[i]] = self.A[min_ind][a[i]]+spaths[min_ind]
		return spaths[y]
	
	#Recursively determine the shortest paths between x and y
	def shortest_path(self, x, y):
		print "Computing the shortest path between" + str(x) + "and" +str(y)
		if self.M[x][y] < float('inf'):
			return self.M[x][y]
		else:
			min = float('inf')
			sources = self.sources(y)
			for source in sources:
				if self.shortest_path(x,source)+self.A[source][y] < self.M[x][y]:
					self.M[x][y] = self.shortest_path(x,source)+self.A[source][y]
			return self.M[x][y]
		
	#Returns the nodes which are immediate sources to the input node
	def sources(self, x):
		s = []
		for i in range(self.n):
			if self.A[i][x] != float('inf'):
				s.append(i)
		return s
	
	#Returns the nodes which are immediate sinks of the input node
	def adjacents(self,x):
		a = []
		for i in range(self.n):
			if self.A[x][i] != float('inf'):
				a.append(i)
		return a
		
test = graph()
print test.Dijkstra(0,4)
print test.shortest_path(0,4)