# Author: Sam Champer

# There could well be a better way to do this: I don't do much programming with R!

library(subprocess)

# Spawn a new shell process.
new_proc <- spawn_process("/bin/sh")

# Write to the shell process with the command line string we want to run.
process_write(new_proc, "slim -d HOMING_SUCCESS_RATE=0.5 -d RESISTANCE_FORMATION_RATE=0.05 minimal_gene_drive.slim\n")

# It appears that unlike in Python, R does not automatically know when SLiM is finished running.
# This while loop will wait until SLiM has printed a line that starts with "OUT:".
# Since our SLiM file only prints one line of output, this is all we need.
# If we wanted use a SLiM file with more output, we could do something like have SLiM
# print "END" when it is finished running, and then use that in the startsWith function below.
while (TRUE) {
    # Read the output of the shell process.
    slim_out <- process_read(new_proc, PIPE_STDOUT, timeout = TIMEOUT_INFINITE)
    if (startsWith(slim_out[length(slim_out)], "OUT:"))
        break;
}

# Print only the last line of the shell process, since our desired output from SLiM is only one line:
print(slim_out[length(slim_out)])

# Terminate the process.
process_terminate(new_proc)
