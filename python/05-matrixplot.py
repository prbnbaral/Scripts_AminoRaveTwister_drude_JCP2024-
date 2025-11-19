import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Read the data table
data = pd.read_csv('sys1_MGw4.2O1PO2P_unique_eachvisit_1.8us_ev500ps_matrix_perframe.csv', sep='\t', index_col=0)

# Create a numpy array from the data
values = data.values

# Set the color map for the plot
cmap = plt.cm.get_cmap('Greys')  # You can choose any colormap you like

# Create the plot
fig, ax = plt.subplots(figsize=(10, 8))  # Adjust the figure size as needed
im = ax.imshow(values, cmap=cmap, interpolation='nearest', vmin=0, vmax=1)

# Set the tick labels and positions for x and y axes
ax.set_xticks(np.arange(len(data.columns)), minor=False)
ax.set_yticks(np.arange(len(data.index)), minor=False)
ax.set_xticks(np.arange(-0.5, len(data.columns)), minor=True)
ax.set_yticks(np.arange(-0.5, len(data.index)), minor=True)
ax.set_xticklabels(data.columns, fontsize=10)  # Decrease the font size for x-axis tick labels
ax.set_yticklabels(data.index, fontsize=10)  # Decrease the font size for y-axis tick labels

# Rotate the tick labels on x-axis for better readability
plt.setp(ax.get_xticklabels(), rotation=90, ha="right", rotation_mode="anchor")

# Add a colorbar to indicate the value range
cbar = ax.figure.colorbar(im, ax=ax, fraction=0.046, pad=0.03, aspect=15.5)  # Adjust the fraction and pad parameters to control the height of the colorbar

# Set the title and labels for the plot
plt.title('System 1, 9iter, 1.8µs, ev500ps', fontsize=16)  # Change the plot title
plt.xlabel('Nucleotide Index', fontsize=16)  # Change the x-axis label
plt.ylabel('Magnesium Index', fontsize=16)  # Change the y-axis label

# Add dim grid lines
ax.grid(color='grey', linewidth=0.5, linestyle='-', which='minor')

# Add dim red vertical lines at specific x-axis indexes
ax.axvline(x=6, color='salmon', linewidth=3.5, linestyle='-', alpha=0.5)
ax.axvline(x=24, color='salmon', linewidth=3.5, linestyle='-', alpha=0.5)
ax.axvline(x=26, color='salmon', linewidth=3.5, linestyle='-', alpha=0.5)

# Adjust the height and compress the colorbar to match the graph height
cbar.ax.set_ylim([0, 1])

# Show the plot
#plt.show()
plt.savefig('matrixplot_s1_mg4.2O1PO2Punique_1.6us_ev500ps.png',  bbox_inches='tight', dpi=200)

