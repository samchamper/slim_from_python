# Genearte a shell script to run a large array of SLiM runs locally in parallel.
homing = 0.5
res = 0.0
print_header = True
run_number = 1
for homing_steps in range(10):
    for resistence_steps in range(10):
        print(f"python3 minimal_slim_driver.py -homing {homing:.2f} -res {res:.2f}{' -header' if print_header else ''} > py_data/{run_number}.part &")
        print_header = False
        run_number += 1
        res += 0.01
    res = 0.0
    homing += 0.01
print("wait\ncd py_data\ncat *.part > array_with_python.csv\nrm *.part")