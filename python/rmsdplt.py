import pandas as pd
import matplotlib.pyplot as plt

# read data file using pandas
df = pd.read_csv('rmsd_sys1_1.8us_nontermbb_ev500ps.dat', sep="\s+")

# set column labels
df.columns=['Time','RMSD']

# create basic plot
df.plot(x = 'Time', y = 'RMSD', color = 'red')
plt.ylim(0,25)
plt.xlim(0,3700)
plt.xticks([800, 1600, 2400, 3200], ['0.4', '0.8', '1.2', '1.6'], fontsize=14)
plt.yticks([0, 5, 10, 15, 20, 25], ['0', '5', '10', '15', '20', '25'], fontsize=14)
plt.xlabel('Time (μs)', fontsize=14) 
plt.ylabel('RMSD (Å)', fontsize=14)
# set plot title
plt.title('RMSD of non terminal backbone atoms, metadynamics 9 iters', fontsize=10)
plt.legend().remove()
plt.savefig('rmsd_sys1_1.8us_nontermbb_ev500ps.png',bbox_inches='tight', dpi=200)
