# equality-elimination-for-ITCP-Matlab
# Introduction

The function symCHM of ITCP solves the problem ![equation](https://latex.codecogs.com/svg.latex?%5Cinline%20%5Ctext%7BProj%7D_%7B%5Cboldsymbol%7Bh%7D_p%7D%28%5CGamma_N%5Ccap%20%5Cmathcal%7BL%7D_%7B%5Cmathsf%7BA%7D%7D%29) as a polytope projection under the assumption that the projected region is full-dimensional. The full-dimensionality won't be satisfied if equality exists among the dimensions indexed by ![equation](https://latex.codecogs.com/svg.latex?%5Cinline%20%5Cboldsymbol%7Bh%7D_p). We provid in this folder a GAP version equality elimination function that is capable of removing all the equalities in ![equation](https://latex.codecogs.com/svg.latex?%5Cinline%20%5CGamma_%7BN%7D%20%5Ccap%5Cmathcal%7BL%7D_%7B%5Cmathsf%7BA%7D%7D) to get a full-dimensional polytope.

Denoted as ![equation](https://latex.codecogs.com/svg.latex?%5Cinline%20%5Cmathbb%7BA%7D%5Cboldsymbol%7Bh%7D%5Cleq%20%5Cboldsymbol%7B0%7D) the Shannon cone ![equation](https://latex.codecogs.com/svg.latex?%5CGamma_N) and ![equation](https://latex.codecogs.com/svg.latex?%5Cinline%20%5Cmathbb%7BE%7D%5Cboldsymbol%7Bh%7D%3D%20%5Cboldsymbol%7B0%7D) the network constraint ![equation](https://latex.codecogs.com/svg.latex?%5Cinline%20%5Cmathcal%7BL%7D_%7B%5Cmathsf%7BA%7D%7D). The underline idea of our equality elimination function is to partition the variable vector ![equation](https://latex.codecogs.com/svg.latex?%5Cinline%20%5Cboldsymbol%7Bh%7D) into two disjoint subvectors, the dependent varibale vector ![equation](https://latex.codecogs.com/svg.latex?%5Cinline%20%5Cboldsymbol%7Bh%7D_D) and the independent variable vector ![equation](https://latex.codecogs.com/svg.latex?%5Cinline%20%5Cboldsymbol%7Bh%7D_I), such that the cone ![equation](https://latex.codecogs.com/svg.latex?%5Cinline%20%5Cmathbb%7BA%7D%5Cboldsymbol%7Bh%7D%5Cleq%20%5Cboldsymbol%7B0%7D%5Ccap%20%5Cmathbb%7BE%7D%5Cboldsymbol%7Bh%7D%3D%5Cboldsymbol%7B0%7D) can be written equivalently as 

![equation](https://latex.codecogs.com/svg.latex?%5Cbegin%7Bcases%7D%20%5Cmathbb%7BA%7D_I%5Cboldsymbol%7Bh%7D_I%5Cleq%20%5Cboldsymbol%7B0%7D%5C%5C%20%5Cmathbb%7BE%7D_I%5Cboldsymbol%7Bh%7D_I%3D%5Cboldsymbol%7Bh%7D_D%20%5Cend%7Bcases%7D)

where ![equation](https://latex.codecogs.com/svg.latex?%5Cinline%20%5Cmathbb%7BA%7D_I%5Cboldsymbol%7Bh%7D_I%5Cleq%20%5Cboldsymbol%7B0%7D) is an equality free cone.
## Usage
Our MATLAB version equality elimination function takes 1) a network and 2) a list of indices h_p indicating the projected dimensions as inputs and ouputs 1) the coefficient A_I, b_I of the equality free cone A_Ih_I<=b_I, 2) the coefficient E_p, c_p  of equalities among h_p, E_ph_p = c_p, 3) the intersection of independent variable h_I and h_p.  
```MATLAB
#example
ncinstance = { { { [ 3, 4 ], [ 3, 4, 5 ] }, { [ 2, 3 ], [ 2, 3, 4 ] } }, 3, 6 };
h_p = { [ 1 ], [ 2 ], [ 3 ], [ 4 ], [ 5 ], [ 6 ], [ 4, 5 ], [ 3, 6 ], [ 1, 2 ], [ 2, 3, 4 ] };
[A_I,b_I,E_p,c_p,indepedge] = EqualityEliminationFromNet_indep(ncinstance,h_p);
# A_I, b_I is output 1) 
# E_p, c_p is output 2)
# indepedge := {[ 1 ], [ 2 ], [ 3 ], [ 4 ], [ 5 ], [ 6 ], [ 4, 5 ], [ 3, 6 ], [0], [0] }; is output 3) with [0] indicates the dependent variables that are not in  h_I\cap h_p 
```
