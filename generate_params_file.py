# Genearte a params.txt file to use with the cluster scripts.
homing = 0.5
res = 0.0
print_header = True
for homing_steps in range(50):
    for resistence_steps in range(50):
        print(f"python3 minimal_slim_driver.py -homing {homing:.2f} -res {res:.2f}{' -header' if print_header else ''}")
        print_header = False
        res += 0.01
    res = 0.0
    homing += 0.01
