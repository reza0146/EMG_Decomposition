# EMG_Decomposition
This MATLAB package can be used for decomposing multi-channel electromyography signals into their comprising individual motor unit signals. 
The package implements a blind source separation alogorithm based on the paper published by [Negro et al. (2016)](https://iopscience.iop.org/article/10.1088/1741-2560/13/2/026027/meta).

A MATLAB GUI is developed to visualize the results of the algorithm. The source code for this MATLAB GUI can be found in the `visualization app` directory.

To run the algorithm use the `decompose` function. Note that the `decompose` function relies on the functions in the `funcs` directory.    
```
results = decompose(SIG, ...
    16, ...
    discard = 6, ...
    bandpass=true, ...
    low_cut=20, ...
    high_cut=500,...
    filt_order=2, ...
    verbose=true, ...
    max_iter_ref=50, ...
    max_iter_sep=50, ...
    check_pnr=true, ...
    sil_th=0.9, ...
    pnr_th=15);
```
