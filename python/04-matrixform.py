#/home/pbaral/miniconda3/bin/python

import csv
import collections

#no. of frames in trajectory
num_frames = 3600
# define an empty dictionary
total_word_count = collections.defaultdict(int)

# define the column order
column_order = [
    'CYT1', 'CYT2', 'GUA3', 'CYT4', 'CYT5', 'URA6', 'ADE7', 'ADE8', 'CYT9', 'ADE10',
    'CYT11', 'URA12', 'GUA13', 'CYT14', 'CYT15', 'ADE16', 'ADE17', 'URA18', 'GUA19',
    'CYT20', 'CYT21', 'GUA22', 'GUA23', 'URA24', 'CYT25', 'CYT26', 'CYT27', 'ADE28',
    'ADE29', 'GUA30', 'CYT31', 'CYT32', 'CYT33', 'GUA34', 'GUA35', 'ADE36', 'URA37',
    'ADE38', 'ADE39', 'ADE40', 'ADE41', 'GUA42', 'URA43', 'GUA44', 'GUA45', 'ADE46',
    'GUA47', 'GUA48', 'GUA49', 'GUA50', 'GUA51', 'CYT52', 'GUA53', 'GUA54'
]

# loop to read the data file line by line
with open('sys1_MGw4.2O1PO2P_unique_eachvisit_1.8us_ev500ps.dat') as f:
    reader = csv.reader(f, delimiter=' ')
    for row in reader:
        mg_no = row[0]
        # loop to count the words and save it in the dictionary
        for i in range(1, len(row)):
            word = row[i].strip()
            if word != '':
                total_word_count[(mg_no, word)] += 1

# write the matrix in the desired format
with open('sys1_MGw4.2O1PO2P_unique_eachvisit_1.8us_ev500ps_matrix_perframe.csv', 'w') as f:
    writer = csv.writer(f, delimiter='\t')
    # Write the first row which includes column names
    writer.writerow([''] + column_order)
    # Loop to write the MG1, MG2, MG3, .... values in the first column
    for i in range(1, 41):
        mg_no = 'MG' + str(i)
        print(mg_no)
        # write the matrix values in the output file
#        writer.writerow([mg_no] + [total_word_count[(mg_no, column)] for column in column_order]) #use this line if you don't want to divide the data by num frames
        writer.writerow([mg_no] + [total_word_count[(mg_no, column)]/num_frames for column in column_order])

