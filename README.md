# SIcollective
Code for Crocker, A., Strömbom, D. Susceptible-Infected-Susceptible type COVID-19 spread with collective effects. Sci Rep 13, 22600 (2023). https://doi.org/10.1038/s41598-023-49949-7.

Hysteresis.m is the function used to investigate hysteresis effects in the model resulting from changing the collective cooperation threshold T over time. Run the function by specifying the two parameters g=disease transmission rate and r=recovery rate in Hysteresis(g,r). To reproduce Figure 4 in the manuscript use g=0.2 and r=1/14, i.e. run Hysteresis(0.2,1/14). 
