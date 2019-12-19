# GPU Benchmark Suite

Based on Rodinia 3.1

Contributors:

* Alankrith Krishnan

* Alisha Sawant

## Benchmarks Used

* backprop
* cfd
* gaussian
* heartwall
* lavaMD
* nn
* particlefilter
* streamcluster

## Steps to run

* Note that these scripts automatically set the GPU device to 1, if you want to use a different GPU, please change `export CUDA_VISIBLE_DEVICES=1` to the corresponding GPU number in the cluster.

* Run `setup_benchmark.sh` to pull CUDA samples and install them, and compile all the benchmark files

```bash
chmod +x setup_benchmark.sh
./setup_benchmark.sh
```

* Then run `run_benchmark.sh` with any number of parameters of programs (folder names in cuda or cuda_optimized) or alternatively, use all to run all of them:

```bash
chmod +x run_benchmark.sh
./run_benchmark.sh all
```

* Alternatively, you can run `make` in the outer directory or within any of the specific benchmarks to compile the programs. The command for running code is in a file called `run`, in each directory.
