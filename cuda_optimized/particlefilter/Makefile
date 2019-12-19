#makefile

include ../../common/make.config

CC := nvcc

INCLUDE := $(CUDA_DIR)/include

all: float

float: ex_particle_CUDA_float_seq.cu
	$(CC) -I$(INCLUDE) -L$(CUDA_LIB_DIR) -lcuda -g -lm -O3 -use_fast_math -arch sm_35 -use_fast_math ex_particle_CUDA_float_seq.cu -o particlefilter_float

clean:
	rm particlefilter_float
