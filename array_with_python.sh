python3 minimal_slim_driver.py -homing 0.5 -res 0.00 -header > py_data/1.part &
python3 minimal_slim_driver.py -homing 0.5 -res 0.01 > py_data/2.part &
python3 minimal_slim_driver.py -homing 0.5 -res 0.02 > py_data/3.part &
python3 minimal_slim_driver.py -homing 0.5 -res 0.03 > py_data/4.part &
python3 minimal_slim_driver.py -homing 0.5 -res 0.04 > py_data/5.part &
python3 minimal_slim_driver.py -homing 0.5 -res 0.05 > py_data/6.part &
python3 minimal_slim_driver.py -homing 0.5 -res 0.06 > py_data/7.part &
python3 minimal_slim_driver.py -homing 0.5 -res 0.07 > py_data/8.part &
wait
cd py_data
cat *.part > array_with_python.csv
rm *.part

