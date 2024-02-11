# README
This program was used in the paper titled "A hybrid in silico/in-cell controller mitigates yield loss due to process-model mismatch in overexpression of a rate-limiting enzyme" by Ohkubo _et al_., published on _bioRxiv_ in 2024. 
In this study, MATLAB/Simulink 2022a and following products and toolboxes were used. We have not confirmed that the program works with any other version.
- Simulink Design Optimization
- Optimization Toolbox
- Parallel Computing Toolbox and MATLAB Parallel Server
The program consists of a Simulink model file, and MATLAB codes for parameter estimation, process input optimization, and PMM simulation.

# Files 
- Simulink model: FA234.slx
  - You can simulate models of three Engineered E. Coli strains, FA2, FA3 and FA4 using this file only with Simulink.
  - You can select the strain models with manual switches.
- Parameter estimation and simulation
  - Main code: EstimateParameters_FA234.mlx
  - File containing estimated parameter values: pOpt_FA234.mat
  - File containing log of parameter estimation: optInfo_FA234.mat
- Hold-out validation
  - In this paper, parameter estimation and holdout verification were performed on a remote computer cluster, but with code modification, these programs can be run on a local computer. 
  - Main code: HoldoutValidation_FA234.mlx
  - Files containing estimated values: pOptV_FA234.mat
- IPTG input optimization
-   Main codes: 
    - OptimizeInput_FA2.mlx
    - OptimizeInput_FA3.mlx
    - OptimizeInput_FA4.mlx
  - Files containing the optimized input values:
    - optInput_FA2.mat
    - optInput_FA3.mat
    - optInput_FA4.mat
- PMM simulation: PMM_Simulations_FA234.mlx
