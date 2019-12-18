include common/make.config

CUDA_DIRS := backprop cfd gaussian heartwall hotspot hotspot3D lavaMD myocyte nn particlefilter srad streamcluster

all: CUDA CUDA_optimized

CUDA:
	cd cuda/backprop;			make
	cd cuda/cfd;				make
	cd cuda/gaussian;			make
	cd cuda/heartwall;			make
	cd cuda/hotspot;			make
	cd cuda/hotspot3D;			make
	cd cuda/lavaMD;				make
	cd cuda/myocyte;			make
	cd cuda/nn;				make
	cd cuda/particlefilter;			make
	cd cuda/srad/srad_v1;			make
	cd cuda/streamcluster;			make  

CUDA_optimized:
	cd cuda_optimized/backprop;		make
	cd cuda_optimized/cfd;			make
	cd cuda_optimized/gaussian;		make
	cd cuda_optimized/heartwall;		make
	cd cuda_optimized/hotspot;		make
	cd cuda_optimized/hotspot3D;		make
	cd cuda_optimized/lavaMD;		make
	cd cuda_optimized/myocyte;		make
	cd cuda_optimized/nn;			make
	cd cuda_optimized/particlefilter;	make
	cd cuda_optimized/srad/srad_v1;		make
	cd cuda_optimized/streamcluster;	make 
		
clean: 
	for dir in $(CUDA_DIRS) ; do cd cuda/$$dir ; make clean ; cd ../.. ; done
	for dir in $(CUDA_DIRS) ; do cd cuda_optimized/$$dir ; make clean ; cd ../.. ; done
	rm density*
	rm output*
	rm image_out.pgm
	rm momentum