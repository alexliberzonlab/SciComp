from scipy.misc import imread
from numpy import *
d = imread("e18data.jpg")
shape(d)
m_r = mean(d[:,:,0]) / 255.0 * 100.0
m_g = mean(d[:,:,1]) / 255.0 * 100.0
m_b = mean(d[:,:,2]) / 255.0 * 100.0