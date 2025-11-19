#Import the necessary libraries
import numpy as np 
import matplotlib.pyplot as plt 
import scipy.stats as st

#Read the data from file
data = np.genfromtxt("T1T2T4_S1_1.8us_ev500ps.dat", delimiter="")
 
#Extract the columns from the data
T1 = data[:,0]
T2 = data[:,1]
T4 = data[:,2] 

#Create subplots
fig, axs = plt.subplots(nrows = 3, ncols = 1, figsize=(3,6))
fig.subplots_adjust(hspace=0.3)

#Plot hist2d
#axs[0].hist2d(T2,T1, bins=[50,50], cmap='YlGnBu')
#axs[1].hist2d(T4,T2, bins=[50,50], cmap='YlGnBu')
#axs[2].hist2d(T4,T1, bins=[50,50], cmap='YlGnBu')
#Set labels for the X & Y axis
fsize=6
axs[0].set_xlabel("T2",fontsize=fsize)
axs[0].set_ylabel("T1", fontsize=fsize)

axs[1].set_xlabel("T4", fontsize=fsize)
axs[1].set_ylabel("T2", fontsize=fsize)

axs[2].set_xlabel("T4", fontsize=fsize)
axs[2].set_ylabel("T1", fontsize=fsize)

#Plot and set the colorbar
plt1 = fig.colorbar(axs[0].hist2d(T2,T1,bins=[50,50], cmap='YlGnBu', density=True, weights=np.ones_like(T2)/2)[3], ax=axs[0])
plt1.ax.tick_params(labelsize=6)

plt2 = fig.colorbar(axs[1].hist2d(T4,T2,bins=[50,50], cmap='YlGnBu', density=True, weights=np.ones_like(T4)/2)[3], ax=axs[1])
plt2.ax.tick_params(labelsize=6)

plt3 = fig.colorbar(axs[2].hist2d(T4,T1,bins=[50,50], cmap='YlGnBu', density=True, weights=np.ones_like(T4)/2)[3], ax=axs[2])
plt3.ax.tick_params(labelsize=6)

for i in range(0, 3):
    axs[i].set_xlim([-6, 96])
    axs[i].set_xticks(range(0, 102, 6))
    axs[i].set_ylim([102, 0])
    axs[i].set_yticks(range(96, -6, -6))
    axs[i].xaxis.set_tick_params(labelsize = 5)
    axs[i].yaxis.set_tick_params(labelsize = 5)
#    axs[i].plot([4.2], [4.2], 'rx', markersize=10)

axs[0].plot([11.57], [10.73], 'rx', markersize=1.5)
axs[1].plot([9.18], [11.57], 'rx', markersize=1.5)
axs[2].plot([9.18], [10.73], 'rx', markersize=1.5)

plt.savefig('2d_s1_contact1.8us_ev500ps.png', bbox_inches='tight', dpi=200)
