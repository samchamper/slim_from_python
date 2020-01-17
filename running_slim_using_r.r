# Author: Sam Champer

# This is a much cleaner way of running SLiM from R, and should probably be prefered in all cases over the other method:

# Store the output of SLiM.
slim_out <- system("slim -d HOMING_SUCCESS_RATE=0.5 -d RESISTANCE_FORMATION_RATE=0.01 minimal_gene_drive.slim", intern=TRUE)

# Print only the last line.
print(slim_out[length(slim_out)])

