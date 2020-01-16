slim -d HOMING_SUCCESS_RATE=0.5 -d RESISTANCE_FORMATION_RATE=0.00 minimal_gene_drive.slim > nopy_data/1.part &
slim -d HOMING_SUCCESS_RATE=0.5 -d RESISTANCE_FORMATION_RATE=0.01 minimal_gene_drive.slim > nopy_data/2.part &
slim -d HOMING_SUCCESS_RATE=0.5 -d RESISTANCE_FORMATION_RATE=0.02 minimal_gene_drive.slim > nopy_data/3.part &
slim -d HOMING_SUCCESS_RATE=0.5 -d RESISTANCE_FORMATION_RATE=0.03 minimal_gene_drive.slim > nopy_data/4.part &
slim -d HOMING_SUCCESS_RATE=0.5 -d RESISTANCE_FORMATION_RATE=0.04 minimal_gene_drive.slim > nopy_data/5.part &
slim -d HOMING_SUCCESS_RATE=0.5 -d RESISTANCE_FORMATION_RATE=0.05 minimal_gene_drive.slim > nopy_data/6.part &
slim -d HOMING_SUCCESS_RATE=0.5 -d RESISTANCE_FORMATION_RATE=0.06 minimal_gene_drive.slim > nopy_data/7.part &
slim -d HOMING_SUCCESS_RATE=0.5 -d RESISTANCE_FORMATION_RATE=0.07 minimal_gene_drive.slim > nopy_data/8.part &
wait
cd nopy_data
grep "OUT:" *.part > array_without_python.csv
rm *.part

