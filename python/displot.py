import matplotlib.pyplot as plt 
import pandas as pd

#read the files
df1 = pd.read_csv('distance_T1com_1.8us_ev500ps.dat', sep='\s+') 
df2 = pd.read_csv('distance_T2com_1.8us_ev500ps.dat', sep='\s+') 
df3 = pd.read_csv('distance_T3com_1.8us_ev500ps.dat', sep='\s+')

#plot the data
plt.plot(df1.iloc[:,0], df1.iloc[:,1], label='T1', color= 'red') 
plt.plot(df2.iloc[:,0], df2.iloc[:,1], label='T2', color= 'blue')
plt.plot(df3.iloc[:,0], df3.iloc[:,1], label='T4', color= 'green') 

#set plot aesthetics
plt.ylim(0,80)
plt.xlim(0,3600)
plt.xticks([800, 1600, 2400, 3200, 3600], ['0.4', '0.8', '1.2', '1.6', '1.8'], fontsize=14)
plt.yticks([0, 10, 20, 30, 40, 50, 60, 70, 80], ['0', '10', '20', '30', '40', '50', '60', '70', '80'], fontsize=14)
plt.legend(loc='upper left')
plt.xlabel('Time (μs)', fontsize=14)
plt.ylabel('Distance (Å)', fontsize=14)
#show plot
plt.title('Change of major tertiary contact (T1, T2, T4) COM distances', fontsize=10)
plt.savefig('distance_s1_T1T2T3com_1.8us_ev500ps.png', bbox_inches='tight', dpi=200)
