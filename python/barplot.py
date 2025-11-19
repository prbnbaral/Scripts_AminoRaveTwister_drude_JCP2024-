#/home/pbaral/miniconda3/bin/python

import matplotlib.pyplot as plt
import pandas as pd


values = []
labels = []

with open('sys1histo_MGw4.2O1PO2Punique_1.8us_ev500ps.dat', 'r') as file:
    for line in file:
        line = line.strip().split(' ')
        label, value = line
        values.append(float(value))
        labels.append(label)

labels_int = [i for i in range(len(labels))]
plt.bar(labels_int, values, align="center", color="red")
#plt.figure(figsize=(8,6))
plt.xticks(labels_int, labels, rotation=90, fontsize = 6)
plt.yticks(fontsize = 14)
plt.xlabel("Residues", fontsize = 16)
plt.ylabel("Probability", fontsize = 16)
plt.title('Probability of MG ions being within 4.2 Å of nonbridging phosphate oxygens', fontsize = 8)

plt.savefig('probability_s1_mg4.2I1PO2Punique_1.8us_ev500ps.png', bbox_inches='tight', dpi=200)


