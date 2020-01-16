# Author: Sam Champer

# Once you have a nice array of data from SLiM,
# you might want to do something with it.
# Here's a little example just for fun.

import matplotlib.pyplot as plt
from mpl_toolkits import mplot3d
import pandas as pd
import numpy as np

#We'll graph:
# 'Drive homing rate' (col 0) on the X, 
# 'Resistance formation rate' (col 1) on Y,
# and outcome (final drive rate, (col 3)) on Z.
data = pd.read_csv(r"SGE_data\output.csv")
homing_rate = data.iloc[:,0]
res_rate = data.iloc[:,1]
final_rate = data.iloc[:,3]

fig = plt.figure()
ax = plt.axes(projection='3d')
ax.plot_trisurf(homing_rate, res_rate, final_rate, cmap='magma')
ax.set_title("Toy gene Drive success")
ax.set_xlabel("Drive homing rate")
ax.set_ylabel("Resistance formation rate")
ax.set_xlabel("Drive homing rate")
ax.set_zlabel("Final drive rate")
plt.show()
