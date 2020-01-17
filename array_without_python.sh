slim -d HOMING_SUCCESS_RATE=0.5 -d RESISTANCE_FORMATION_RATE=0.000 minimal_gene_drive.slim > nopy_data/1.part &
slim -d HOMING_SUCCESS_RATE=0.5 -d RESISTANCE_FORMATION_RATE=0.005 minimal_gene_drive.slim > nopy_data/2.part &
slim -d HOMING_SUCCESS_RATE=0.5 -d RESISTANCE_FORMATION_RATE=0.010 minimal_gene_drive.slim > nopy_data/3.part &
slim -d HOMING_SUCCESS_RATE=0.5 -d RESISTANCE_FORMATION_RATE=0.015 minimal_gene_drive.slim > nopy_data/4.part &
slim -d HOMING_SUCCESS_RATE=0.5 -d RESISTANCE_FORMATION_RATE=0.020 minimal_gene_drive.slim > nopy_data/5.part &
slim -d HOMING_SUCCESS_RATE=0.5 -d RESISTANCE_FORMATION_RATE=0.025 minimal_gene_drive.slim > nopy_data/6.part &
slim -d HOMING_SUCCESS_RATE=0.5 -d RESISTANCE_FORMATION_RATE=0.030 minimal_gene_drive.slim > nopy_data/7.part &
slim -d HOMING_SUCCESS_RATE=0.5 -d RESISTANCE_FORMATION_RATE=0.035 minimal_gene_drive.slim > nopy_data/8.part &
wait
cd nopy_data
grep "OUT:" *.part > array_without_python.csv
rm *.part

