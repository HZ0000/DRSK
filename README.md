# Doubly Robust Stein-Kernelized Monte Carlo Estimator: Simultaneous Bias-Variance Reduction and Supercanonical Convergence

This repository contains code related to the JMLR paper
"Doubly Robust Stein-Kernelized Monte Carlo Estimator: Simultaneous Bias-Variance Reduction and Supercanonical Convergence" 
by Henry Lam and Haofeng Zhang. 

Paper link: https://arxiv.org/abs/2110.12131

# Citation
If you find this repository or the ideas presented in our paper useful, please consider citing the following:
```
@article{lam2023doubly,
  title={Doubly Robust Stein-Kernelized Monte Carlo Estimator: Simultaneous Bias-Variance Reduction and Supercanonical Convergence},
  author={Lam, Henry and Zhang, Haofeng},
  journal={Journal of Machine Learning Research},
  volume={24},
  number={85},
  pages={1--58},
  year={2023}
}
```

# Implementation

For running experiments on the example of "Computer Communication Network": <br />
1. To obtain the data from the exact posterior distribution (without MCMC), run <br />
experiment - 2022 setting1truth.R/experiment - 2022 setting2truth.R/experiment - 2022 setting3truth.R <br />
to obtain data that are similar to the ones in <br />
CF1-truth.csv/CF2-truth.csv/CF3-truth.csv  <br />
Note that our code also prints the ground-truth target value.
2. To obtain the biased data (with MCMC), run <br />
experiment - 2022 setting1MCMC.R/experiment - 2022 setting2MCMC.R/experiment - 2022 setting3MCMC.R <br />
to obtain data that are similar to the ones in <br />
CF1-100mean-MCMC1.csv/CF2-100mean-MCMC1.csv/CF3-100mean-MCMC1.csv  <br />
3. To implement different algorithms (including our proposal DRSK) on the data, run <br />
drsk_computer.py <br />

