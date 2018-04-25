#!/usr/bin/python
from scipy.interpolate import interp1d
from scipy.optimize import fsolve
import matplotlib.pyplot as plt
import numpy as np
import argparse
import sys

## DATA
# low affinity data is (nitrate concentration in mM, 
# rate in micromoles of nitrate per g per hour)
# low_WT_data = [(0,0), (0.125,0.2), (0.25,0.8), (0.5,1.35), (1,1.9), (2.5,3.5), (5,5.3), (10,7.6)]
low_WT_no3 = [0, 0.125, 0.25, 0.5, 1, 2.5, 5, 10]
low_WT_rate = [0, 0.2, 0.8, 1.35, 1.9, 3.5, 5.3, 7.6]
low_intr_lin = interp1d(low_WT_no3, low_WT_rate)

low_xnew = np.linspace(0.0, 10.0)
low_ynew = low_intr_lin(low_xnew)

# high affinity data is (nitrate concentration in microM converted to mM, 
# rate in micromoles of nitrate per g per hour)
# high_WT_data = [(0,0), (0.0125,0.09), (0.025,0.18), (0.05,0.22), (0.075,0.27), (0.1,0.31), (0.15,0.5),(0.2,0.54)]
high_WT_no3 = [0, 0.0125, 0.025, 0.05, 0.075, 0.1, 0.15, 0.2]
high_WT_rate = [0, 0.09, 0.18, 0.22, 0.27, 0.31, 0.5, 0.54]
high_intr_lin = interp1d(high_WT_no3, high_WT_rate)

high_xnew = np.linspace(0.0, 0.2)
high_ynew = high_intr_lin(high_xnew)

def func_solve_low(x, new_y):
    return (new_y - low_intr_lin(x))

def func_solve_high(x, new_y):
    return (new_y - high_intr_lin(x))

def uptake_rate(nRate, affinity):
    affinity = affinity.lower()
    if affinity == 'low':
        initial_guess = 0.1
        ans, = fsolve(func_solve_low, initial_guess, nRate)
        return (ans)
    if affinity == 'high':
        initial_guess = 0.01
        ans, = fsolve(func_solve_high, initial_guess, nRate)
        return(ans)


if __name__ == "__main__":
#    parser = argparse.ArgumentParser(description='Computes nitrate concentration from uptake rate')
#    parser.add_argument('--nrate', metavar = 'r', type = 'float', help='nitrate uptake rate')
#    parser.add_argument('--affinity', metavar = 'a', type = 'str', choices = ['low', 'high'], help='affinity, either low or high')
#
#    args = parser.parse_args()
#    nrate = args.nrate
#    affinity = args.affinity
    nrate = float(sys.argv[1])
    affinity = sys.argv[2]
    error_msg = "The current dataset supports interpolation of uptake rate and nitrogen concentration (mM). The data point is outside the uptake rate range."

    if affinity =="low":
        if nrate < 0 or nrate > 7.6:
            print(error_msg)
            print("Range of uptake rate at low affinity is from 0 umol of nitrate per g per hr to 7.6 umol of nitrate per g per hr")
        else:
            no3_conc = uptake_rate(nrate, affinity)
            print ("Nitrate concentration for uptake rate of {} (micromoles of nitrate per g per hour) at {} affinity is: {} mM.".format(str(nrate), affinity, str(round(no3_conc, 3))))

    if affinity == "high":
        if nrate < 0 or nrate > 0.54:
            print(error_msg)
            print("Range of uptake rate at low affinity is from 0 umol of nitrate per g per hr to 0.54 umol of nitrate per g per hr")
        else:
            no3_conc = uptake_rate(nrate, affinity)
            print ("Nitrate concentration for uptake rate of {} (micromoles of nitrate per g per hour) at {} affinity is: {} mM.".format(str(nrate), affinity, str(round(no3_conc, 3))))

