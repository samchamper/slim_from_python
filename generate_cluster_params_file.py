# Genearte a params.txt file to use with the cluster scripts.
homing = 0.5
res = 0.0
print_header = True
for homing_steps in range(51):
    for resistence_steps in range(51):
        print(f"python3 minimal_slim_driver.py -homing {homing:.2f} -res {res:.3f}{' -header' if print_header else ''}")
        print_header = False
        res += 0.001
    res = 0.0
    homing += 0.01
