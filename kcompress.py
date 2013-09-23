#Giri Gopalan
#8-3-2012
#What follows is a short script that performs k means clustering to compress an image.
#In particular, an image is treated as a set of 2 by 2 tiles which are each elements of R^4.
#Each tile is then replaced with the closest clusters' average value.

#EDIT 8-6-2012
#The code has been modified to also determine the singular vectors and project the samples onto these, representing
#each tile with 3 principal vectors. 

import Image
import sys
from numpy import *
from scipy import linalg, dot
from scipy.linalg import svd
from scipy.cluster.vq import kmeans
from scipy.cluster.vq import vq

#Method that returns the max pair of indices of the vector
def find_max(v):
	vtups = []
	for i in range(4):
		vtups.append((v[i],i))
	vsorted = sorted(vtups)
	return [vsorted[0][1], vsorted[1][1]]

#Method that uses scipy to find the top k singular vectors of input matrix D
def rvectors(D,k):
	U,s,Vh = svd(D,full_matrices=False)
	
	#Vh[2] = [0,0,0,0]
	#Vh[3] = [0,0,0,0]
	return Vh

def compress(D):
	U,s,Vh = svd(D,full_matrices=False)
	U = U.transpose()
	for j in range(len(U[3])):
		print j
		U[3][j] = 0.0
		U[2][j] = 0.0
		U[1][j] = 0.0
	U = U.transpose()
	Vh[1] = [0.0,0.0,0.0,0.0]
	Vh[2] = [0.0,0.0,0.0,0.0]
	Vh[3] = [0.0,0.0,0.0,0.0]
	return array(mat(U)*mat(diag(s))*mat(Vh))

#Method that uses scipy to do kmeans clustering
def cluster(m, k):
	codebook, distortion = kmeans(m, k)	
	return codebook

#Maps samples to clusters given a codebook and returns the code, using scipy
def quantize(samples, codebook):
	code, distortion = vq(samples, codebook)
	return code

#Read in image data and form three matrices: one for R, G and B values.
print "Reading in image and processing matrices..."
image_file = sys.argv[1]
img = Image.open(image_file)
img_dat = list(img.getdata())
img_width = int(img.size[0])
img_length = int(img.size[1])

R = []
G = []
B = []
n = 0

for i in range(img_length):
	new_Rline = []
	new_Gline = []
	new_Bline = []
	for j in range(img_width):
		new_Rline.append(float(img_dat[n][0]))
		new_Gline.append(float(img_dat[n][1]))
		new_Bline.append(float(img_dat[n][2]))
		n = n+1
	R.append(new_Rline)
	G.append(new_Gline)
	B.append(new_Bline)

#Retrieve samples in R^4 from the images. We assume that both the width and height are even.
print "Retrieving samples from images"
Rsamples = []
Gsamples = []
Bsamples = []
i = 0
while (i < img_length-1):
	j = 0
	while(j < img_width-1):
		Rsamples.append([R[i][j],R[i][j+1],R[i+1][j],R[i+1][j+1]])
		Gsamples.append([G[i][j],G[i][j+1],G[i+1][j],G[i+1][j+1]])
		Bsamples.append([B[i][j],B[i][j+1],B[i+1][j],B[i+1][j+1]])
		j = j+2
	i = i+2
Rsamples = array(Rsamples)
Gsamples = array(Gsamples)
Bsamples = array(Bsamples)

#Cluster samples using kmeans clustering and compress 
print "Clustering and Performing Vector Quantization"
k = 5
RClusters = cluster(Rsamples,k)
GClusters = cluster(Gsamples,k)
BClusters = cluster(Bsamples,k)
RCode = quantize(Rsamples, RClusters)
GCode = quantize(Gsamples, GClusters)
BCode = quantize(Bsamples, BClusters)

print RClusters
print GClusters
print BClusters
print RCode
print GCode
print BCode

#Determine the principal components of the image data
print "Finding Principal Components"
#Rcomps = rvectors(Rsamples,3)
#Gcomps = rvectors(Gsamples,3)
#Bcomps = rvectors(Bsamples,3)

#Determine the expansion of the samples in the principle components.
#Rcompressed = compress(Rsamples)
#Gcompressed = compress(Gsamples)
#Bcompressed = compress(Bsamples)

#print Rproj 
#print Rsamples

#Project each sample into a 3-dimensional subspace spanned by the three top right singular vectors,
#and use this as the compressed sample.
#for i in range(32000):
#	vsorted = find_max(Rproj[i])
#	for j in range(4):
#		if j not in vsorted:
#			Rproj[i][j] = 0

#for i in range(32000):
#	vsorted = find_max(Gproj[i])
#	for j in range(4):
#		if j not in vsorted:
#			Gproj[i][j] = 0

#for i in range(32000):
#	vsorted = find_max(Bproj[i])
#	for j in range(4):
#		if j not in vsorted:
#			Bproj[i][j] = 0

#Rcompressed = array(mat(Rproj)*mat(Rcomps))
#Gcompressed = array(mat(Gproj)*mat(Gcomps))
#Bcompressed = array(mat(Bproj)*mat(Bcomps))

#print mat(Rcompressed)-mat(Rsamples)
#Paint how the compressed image looks and display it
compressed = img.copy()

print "Painting compressed image"
i = 0
n = 0
while (i < img_length-1):
	j = 0
	while(j < img_width-1):
		#print (i,j)
		compressed.putpixel((j,i), (int(RClusters[RCode[n]][0]),int(GClusters[GCode[n]][0]),int(BClusters[BCode[n]][0])))
		compressed.putpixel((j+1,i), (int(RClusters[RCode[n]][1]),int(GClusters[GCode[n]][1]),int(BClusters[BCode[n]][1])))
		compressed.putpixel((j,i+1), (int(RClusters[RCode[n]][2]),int(GClusters[GCode[n]][2]),int(BClusters[BCode[n]][2])))
		compressed.putpixel((j+1,i+1), (int(RClusters[RCode[n]][3]),int(GClusters[GCode[n]][3]),int(BClusters[BCode[n]][3])))
		j = j+2
		n = n+1
	i = i+2

compressed.save("k5.bmp")
r,g,b = compressed.split()
g.show()
	
	


