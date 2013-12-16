from numpy import *
from scipy import *
from math import atan2

def getangle(v1):
	ang = atan2(v1[1], v1[0])
	if (ang < 0):
		ang = ang + (2*pi)
	return ang

def oneplate(r1,r2,a1,a2):
	# [area,cx,cy,Ix,Iy,Ixy] = plate(r1,r2,a1,a2)
	#
	# from Gribble PL, Scott SH (2002) J. Neurosci. Methods 113(2):185-195
   c1=(r2-r1)/(a2-a1)
   c2=a1*c1
   c3=r1-c2
   area=(1./6.)*(c1**2)*((a2**3)-(a1**3)) + (1./2.)*c3*c1*((a2**2)-(a1**2)) + (1./2.)*(c3**2)*(a2-a1)
   cx=(((1./3.)*sin(a2) - (1./3.)*sin(a1))*(c3**3) + (cos(a2) - cos(a1) - a1*sin(a1) + a2*sin(a2))*c1*(c3**2) + \
      (((a2**2)-2)*sin(a2) + (-(a1**2) + 2)*sin(a1) + 2*a2*cos(a2) - 2*a1*cos(a1)) * \
      (c1**2)*c3 + (((a2**2)-2)*cos(a2) + (-(a1**2)+2)*cos(a1) + ((1./3.)*(a2**3) - 2*a2)*sin(a2) + \
      (-(1./3.)*(a1**3) + 2*a1)*sin(a1))*(c1**3)) / \
      (((1./2.)*a2 - (1./2.)*a1)*(c3**2) + (1./2.)*c3*c1*((a2**2)-(a1**2)) + ((1./6.)*(a2**3) - (1./6.)*(a1**3))*(c1**2))
   cy=((-(1./3.)*cos(a2) + (1./3.)*cos(a1))*(c3**3) + (sin(a2) - sin(a1) + a1*cos(a1) - a2*cos(a2))*c1*(c3**2) + \
      ((-(a2**2)+2)*cos(a2) + ((a1**2) - 2)*cos(a1) + 2.*a2*sin(a2) - 2.*a1*sin(a1)) * \
      (c1**2)*c3 + ((2*a2 - (1./3.)*(a2**3))*cos(a2) + ((1./3.)*(a1**3) - 2.*a1)*cos(a1) + ((a2**2) - 2)*sin(a2) + \
      (-(a1**2) + 2)*sin(a1))*(c1**3)) / \
      (((1./2.)*a2 - (1./2.)*a1)*(c3**2) + (1./2.)*c3*c1*((a2**2)-(a1**2)) + ((1./6.)*(a2**3) - (1./6.)*(a1**3))*(c1**2))
   Ix=((1./18.)*sin(2.*a1) - (1./9.)*a1 + (1./9.)*a2 - (1./18.)*sin(2.*a2))*(c3**4) + (-(2./9.)*(a1**2) + (1./9.)*cos(2.*a1) - \
      (1./9.)*cos(2.*a2) - (2./9.)*a2*sin(2.*a2) + (2./9.)*a1*sin(2.*a1) + (2./9.)*(a2**2))*c1*(c3**3) + \
      ((-(1./6.) + (1./3.)*(a1**2.))*sin(2.*a1) + ((1./6.) - (1./3.)*(a2**2))*sin(2.*a2) - (1./3.)*a2*cos(2.*a2) + \
      (1./3.)*a1*cos(2.*a1) + \
      (2./9.)*(a2**3) - (2./9.)*(a1**3))*(c1**2)*(c3**2) + (((1./3.)*a2 - (2./9.)*(a2**3))*sin(2.*a2) + \
      ((2./9.)*(a1**3) - (1./3.)*a1)*sin(2.*a1) + ((1./6.) - (1./3.)*(a2**2))*cos(2.*a2) + (-(1./6.) + \
      (1./3.)*(a1**2))*cos(2.*a1) - (1./9.)*(a1**4) + (1./9.)*(a2**4))*(c1**3)*c3 + (((1./6.)*a2 - \
      (1./9.)*(a2**3))*cos(2.*a2) + ((1./9.)*(a1**3) - (1./6.)*a1)*cos(2.*a1) + \
      ((1./6.)*(a2**2) - (1./18.)*(a2**4) - (1./12.))*sin(2.*a2) + (-(1./6.)*(a1**2) + (1./12.) + (1./18.)*(a1**4))*sin(2.*a1) + \
      (1./45.)*(a2**5) - (1./45.)*(a1**5))*(c1**4)
   Iy=(-(1./9.)*a1 + (1./18.)*sin(2.*a2) + (1./9.)*a2 - (1./18.)*sin(2.*a1))*(c3**4) + (-(1./9.)*cos(2.*a1) - \
      (2./9.)*(a1**2) + (2./9.)*a2*sin(2.*a2) + (2./9.)*(a2**2) + (1./9.)*cos(2.*a2) - \
      (2./9.)*a1*sin(2.*a1))*c1*(c3**3) + ((-(1./6.) + (1./3.)*(a2**2))*sin(2.*a2) + \
      ((1./6.) - (1./3.)*(a1**2))*sin(2.*a1) - (1./3.)*a1*cos(2.*a1) + (2./9.)*(a2**3) + \
      (1./3.)*a2*cos(2.*a2) - (2./9.)*(a1**3))*(c1**2)*(c3**2) + ((-(1./6.) + (1./3.)*(a2**2))*cos(2.*a2) + \
      ((1./6.) - (1./3.)*(a1**2))*cos(2.*a1) + (-(1./3.)*a2 + (2./9.)*(a2**3))*sin(2.*a2) + \
      ((1./3.)*a1 - (2./9.)*(a1**3))*sin(2.*a1) - (1./9.)*(a1**4) + (1./9.)*(a2**4))*(c1**3)*c3 + \
      ((-(1./6.)*a2 + (1./9.)*(a2**3))*cos(2.*a2) + (-(1./9.)*(a1**3) + (1./6.)*a1)*cos(2.*a1) + \
      (-(1./6.)*(a2**2) + (1./18.)*(a2**4) + (1./12.))*sin(2.*a2) + \
      ((1./6.)*(a1**2) - (1./18.)*(a1**4) - (1./12.))*sin(2.*a1) + (1./45.)*(a2**5) - (1./45.)*(a1**5))*(c1**4)
   Ixy=(-(1./18.)*cos(2.*a2) + (1./18.)*cos(2.*a1))*(c3**4) + \
      ((2./9.)*a1*cos(2.*a1) + (1./9.)*sin(2.*a2) - (1./9.)*sin(2.*a1) - (2./9.)*a2*cos(2.*a2))*c1*(c3**3) + \
      (((1./6.) - (1./3.)*(a2**2))*cos(2.*a2) + ((1./3.)*(a1**2) - (1./6.))*cos(2.*a1) - \
      (1./3.)*a1*sin(2.*a1) + (1./3.)*a2*sin(2.*a2))*(c1**2)*(c3**2) +  \
      (((1./3.)*a2 - (2./9.)*(a2**3))*cos(2.*a2) + (-(1./3.)*a1 + (2./9.)*(a1**3))*cos(2.*a1) + \
      ((1./3.)*(a2**2) - (1./6.))*sin(2.*a2) + (-(1./3.)*(a1**2) + (1./6.))*sin(2.*a1))*(c1**3)*c3 + \
      ((-(1./18.)*(a2**4) - (1./12.) + (1./6.)*(a2**2))*cos(2.*a2) + \
      (-(1./6.)*(a1**2) + (1./12.) + (1./18.)*(a1**4))*cos(2.*a1) + \
      (-(1./6.)*a2 + (1./9.)*(a2**3))*sin(2.*a2) + ((1./6.)*a1 - (1./9.)*(a1**3))*sin(2.*a1))*(c1**4)
   return area,cx,cy,Ix,Iy,Ixy

def platemethod(a,r):
	# [PD,IR,M,IX,IY,IXY,CX,CY,CR] = platemethod(a,r)
	#
	# from Gribble PL, Scott SH (2002) J. Neurosci. Methods 113(2):185-195
	#
	# INPUTS:
	# a: numpy array of angles (in radians)
	# r: numpy array of magnitudes
	#
	# OUTPUTS:
	# PD          :preferred direction (radians)
	# IR          :sharpness of tuning
	# M           :mass
	# IX, IY, IXY :moments of inertia
	# CX, CY, CR  :centroid (x,y) and radius of centroid

	# sort the angle and magnitude data by angles
	ii = argsort(a)
	a = a[ii]
	r = r[ii]

	# we don't like zero responses
	ii = where(r<1e-6)[0]
	if len(ii)>0:
		r[ii] = 1e-6

	# compute individual "plates"
	A=zeros(len(a))
	CX=zeros(len(a))
	CY=zeros(len(a))
	IX=zeros(len(a))
	IY=zeros(len(a))
	IXY=zeros(len(a))
	IP=zeros(len(a))
	for i in range(len(a)):
		i1=i
		if (i==len(a)-1):
			i2=0
		else:
			i2=i1+1
		r1=r[i1]
		r2=r[i2]
		a1=a[i1]
		a2=a[i2]
		if (a2<a1):
			a2=a2+(2*pi)
		A[i],CX[i],CY[i],IX[i],IY[i],IXY[i]=oneplate(r1,r2,a1,a2)

	# compute various quantities for output
	gcx = sum(CX*A)/sum(A)
	gcy = sum(CY*A)/sum(A)

	IX=sum(IX)
	IY=sum(IY)
	IXY=sum(IXY)
	M = sqrt(sum(A)/pi)
	PD = getangle([gcx,gcy]) # the preferred direction
	CR = sqrt(gcx**2 + gcy**2)
	CX=gcx
	CY=gcy
	I1 = (IX+IY)/2. + ((IX-IY)/2.)*cos(2.*PD) - IXY*sin(2.*PD)
	I2 = (IX+IY)/2. - ((IX-IY)/2.)*cos(2.*PD) + IXY*sin(2.*PD)
	if (I1>I2):
	   tmp=I1
	   I1=I2
	   I2=tmp
	IR=I1/I2

	return PD,IR,M,IX,IY,IXY,CX,CY,CR

####################################################################
#
# test the platemethod
#

a = loadtxt("neurondata/cell_dirs_001.txt")
r = loadtxt("neurondata/cell_spks_001.txt")
PD,IR,M,IX,IY,IXY,CX,CY,CR = platemethod(a[0,:],r[0,:])
print PD


