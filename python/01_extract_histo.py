import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import os
import sys

#data = pd.read_csv('survey_zdna.dat', sep = '\t')
binwidth = 2
bin_values = np.arange(start=0, stop=98, step=binwidth)
#data_clean = data[data!=0]
#data_clean.to_csv('survey_cleaned.dat', sep = '\t', header = None)

data_read = pd.read_csv('T1T2T4_S1_1.8us_ev500ps.dat', sep = ' ', header = None)
data_t1 = data_read.iloc[:,0]
data_t2 = data_read.iloc[:,1]
data_t4 = data_read.iloc[:,2]

histo_t1 = plt.hist(data_t1, bins=bin_values)
histo_t2 = plt.hist(data_t2, bins=bin_values)
histo_t4 = plt.hist(data_t4, bins=bin_values)

pd.DataFrame({'#x':histo_t1[1][1:], '0':histo_t1[0]}).to_csv('t1_histo.dat', sep = '\t')
pd.DataFrame({'#x':histo_t2[1][1:], '0':histo_t2[0]}).to_csv('t2_histo.dat', sep = '\t')
pd.DataFrame({'#x':histo_t4[1][1:], '0':histo_t4[0]}).to_csv('t4_histo.dat', sep = '\t')

data_t1_histo = pd.read_csv('t1_histo.dat', sep = '\t', header = None)
data_t2_histo = pd.read_csv('t2_histo.dat', sep = '\t', header = None)
data_t4_histo = pd.read_csv('t4_histo.dat', sep = '\t', header = None)

t1_points = data_t1_histo.iloc[:,2]
t2_points = data_t2_histo.iloc[:,2]
t4_points = data_t4_histo.iloc[:,2]

sum_t1 = t1_points.sum()
sum_t2 = t2_points.sum()
sum_t4 = t4_points.sum()

print(sum_t1)
print(sum_t2)
print(sum_t4)

#t1 = []
#for i in t1_points:
#    p = i/(sum_t1*binwidth)
#    print(p)
#    t1.append((p))
#t1 = np.array(t1)
#np.savetxt('try.dat', t1)
#
#os.system('paste t1_histo.dat try.dat > try2.dat')

