# Author: Sam Champer

# Running SLiM in R is easy and clean!

# Run slim using the system() function. Store the output in slim_out.
slim_out <- system("slim -d HOMING_SUCCESS_RATE=0.5 -d RESISTANCE_FORMATION_RATE=0.01 minimal_gene_drive.slim", intern=TRUE)

# Print only the last line, which is the desired output of this particular SLiM file.
print(slim_out[length(slim_out)])

