# GPU Benchmark Suite

Based on Rodinia 3.1

Contributors:

* Alankrith Krishnan

* Alisha Sawant

## Steps to run

* First run `setup_benchmark.sh`

```bash
chmod +x setup_benchmark.sh
./setup_benchmark.sh
```

* Then run `benchmark.sh` with any number of parameters of programs (folder names in cuda/cuda_optimized) or alternatively, use all to run all of them:

```bash
chmod +x run_benchmark.sh
./run_benchmark.sh all
```
