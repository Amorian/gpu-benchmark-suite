#!/bin/bash

module load cuda-10.1
export CUDA_VISIBLE_DEVICES=1

backprop="/backprop 65536"
cfd_single="/euler3d data/cfd/missile.domn.0.2M"
cfd_double="/euler3d_double data/cfd/missile.domn.0.2M"
cfd_pre_single="/pre_euler3d data/cfd/missile.domn.0.2M"
cfd_pre_double="/pre_euler3d_double data/cfd/missile.domn.0.2M"
gaussian="/gaussian -f data/gaussian/matrix4.txt"
heartwall="/heartwall data/heartwall/test.avi 20"
hotspot="/hotspot 512 2 2 data/hotspot/temp_512 data/hotspot/power_512 output.out"
hotspot3D="/3D 512 8 100 data/hotspot3D/power_512x8 data/hotspot3D/temp_512x8 output.out"
lavaMD="/lavaMD -boxes1d 50"
myocyte="/myocyte.out 100 1 0"
nn="/nn cuda/nn/filelist_4 -r 5 -lat 30 -lng 90"
particlefilter="/particlefilter_float -x 128 -y 128 -z 10 -np 1000"
srad_v1="/srad_v1/srad 100 0.5 502 458"
streamcluster="/sc_gpu 10 20 256 65536 65536 1000 none output.txt 1"

cuda="cuda/"
cuda_optimized="cuda_optimized/"

calculate()
{
  result=$(python3 calculations.py)
  echo "${1} GFLOPs/Watt = ${result}" | tee -a result.txt
}

benchmark()
{
  time_power="nvprof --csv --log-file time_power.csv --system-profiling on -u s"
  flops="nvprof --csv --log-file flops.csv --metrics flops_sp,flops_dp"
  echo "$1"
  case "$1" in
    "backprop")
      eval "${time_power} ${cuda}${1}${backprop}"
      eval "${flops} ${cuda}${1}${backprop}"
      calculate "cuda ${1}"
      sleep 10
      eval "${time_power} ${cuda_optimized}${1}${backprop}"
      eval "${flops} ${cuda_optimized}${1}${backprop}"
      calculate "cuda_optimized ${1}"
      ;;
    "cfd")
      echo "Single Precision"
      eval "${time_power} ${cuda}${1}${cfd_single}"
      eval "${flops} ${cuda}${1}${cfd_single}"
      calculate "cuda ${1}"
      sleep 10
      echo "Single Precision"
      eval "${time_power} ${cuda_optimized}${1}${cfd_single}"
      eval "${flops} ${cuda_optimized}${1}${cfd_single}"
      calculate "cuda_optimized ${1}"
      sleep 10
      echo "Double Precision"
      eval "${time_power} ${cuda}${1}${cfd_double}"
      eval "${flops} ${cuda}${1}${cfd_double}"
      calculate "cuda ${1}"
      sleep 10
      echo "Double Precision"
      eval "${time_power} ${cuda_optimized}${1}${cfd_double}"
      eval "${flops} ${cuda_optimized}${1}${cfd_double}"
      calculate "cuda_optimized ${1}"
      sleep 10
      echo "Pre Single Precision"
      eval "${time_power} ${cuda}${1}${cfd_pre_single}"
      eval "${flops} ${cuda}${1}${cfd_pre_single}"
      calculate "cuda ${1}"
      sleep 10
      echo "Pre Single Precision"
      eval "${time_power} ${cuda_optimized}${1}${cfd_pre_single}"
      eval "${flops} ${cuda_optimized}${1}${cfd_pre_single}"
      calculate "cuda_optimized ${1}"
      sleep 10
      echo "Pre Double Precision"
      eval "${time_power} ${cuda}${1}${cfd_pre_double}"
      eval "${flops} ${cuda}${1}${cfd_pre_double}"
      calculate "cuda ${1}"
      sleep 10
      echo "Pre Double Precision"
      eval "${time_power} ${cuda_optimized}${1}${cfd_pre_double}"
      eval "${flops} ${cuda_optimized}${1}${cfd_pre_double}"
      calculate "cuda_optimized ${1}"
      ;;
    "gaussian")
      eval "${time_power} ${cuda}${1}${gaussian}"
      eval "${flops} ${cuda}${1}${gaussian}"
      calculate "cuda ${1}"
      sleep 10
      eval "${time_power} ${cuda_optimized}${1}${gaussian}"
      eval "${flops} ${cuda_optimized}${1}${gaussian}"
      calculate "cuda_optimized ${1}"
      ;;
    "heartwall")
      eval "${time_power} ${cuda}${1}${heartwall}"
      eval "${flops} ${cuda}${1}${heartwall}"
      calculate "cuda ${1}"
      sleep 10
      eval "${time_power} ${cuda_optimized}${1}${heartwall}"
      eval "${flops} ${cuda_optimized}${1}${heartwall}"
      calculate "cuda_optimized ${1}"
      ;;
    "hotspot")
      eval "${time_power} ${cuda}${1}${hotspot}"
      eval "${flops} ${cuda}${1}${hotspot}"
      calculate "cuda ${1}"
      sleep 10
      eval "${time_power} ${cuda_optimized}${1}${hotspot}"
      eval "${flops} ${cuda_optimized}${1}${hotspot}"
      calculate "cuda_optimized ${1}"
      ;;
    "hotspot3D")
      eval "${time_power} ${cuda}${1}${hotspot3D}"
      eval "${flops} ${cuda}${1}${hotspot3D}"
      calculate "cuda ${1}"
      sleep 10
      eval "${time_power} ${cuda_optimized}${1}${hotspot3D}"
      eval "${flops} ${cuda_optimized}${1}${hotspot3D}"
      calculate "cuda_optimized ${1}"
      ;;
    "lavaMD")
      eval "${time_power} ${cuda}${1}${lavaMD}"
      eval "${flops} ${cuda}${1}${lavaMD}"
      calculate "cuda ${1}"
      sleep 10
      eval "${time_power} ${cuda_optimized}${1}${lavaMD}"
      eval "${flops} ${cuda_optimized}${1}${lavaMD}"
      calculate "cuda_optimized ${1}"
      ;;
    "myocyte")
      eval "${time_power} ${cuda}${1}${myocyte}"
      eval "${flops} ${cuda}${1}${myocyte}"
      calculate "cuda ${1}"
      sleep 10
      eval "${time_power} ${cuda_optimized}${1}${myocyte}"
      eval "${flops} ${cuda_optimized}${1}${myocyte}"
      calculate "cuda_optimized ${1}"
      ;;
    "nn")
      eval "${time_power} ${cuda}${1}${nn}"
      eval "${flops} ${cuda}${1}${nn}"
      calculate "cuda ${1}"
      sleep 10
      eval "${time_power} ${cuda_optimized}${1}${nn}"
      eval "${flops} ${cuda_optimized}${1}${nn}"
      calculate "cuda_optimized ${1}"
      ;;
    "particlefilter")
      eval "${time_power} ${cuda}${1}${particlefilter}"
      eval "${flops} ${cuda}${1}${particlefilter}"
      calculate "cuda ${1}"
      sleep 10
      eval "${time_power} ${cuda_optimized}${1}${particlefilter}"
      eval "${flops} ${cuda_optimized}${1}${particlefilter}"
      calculate "cuda_optimized ${1}"
      ;;
    "srad")
      eval "${time_power} ${cuda}${1}${srad_v1}"
      eval "${flops} ${cuda}${1}${srad_v1}"
      calculate "cuda ${1}"
      sleep 10
      eval "${time_power} ${cuda_optimized}${1}${srad_v1}"
      eval "${flops} ${cuda_optimized}${1}${srad_v1}"
      calculate "cuda_optimized ${1}"
      ;;
    "streamcluster")
      eval "${time_power} ${cuda}${1}${streamcluster}"
      eval "${flops} ${cuda}${1}${streamcluster}"
      calculate "cuda ${1}"
      sleep 10
      eval "${time_power} ${cuda_optimized}${1}${streamcluster}"
      eval "${flops} ${cuda_optimized}${1}${streamcluster}"
      calculate "cuda_optimized ${1}"
      ;;
    *)
      echo "Unknown argument"
      ;;
  esac
}

if [ "$#" -eq 0 ]
then
  echo "Need at least one argument"
  exit 1
fi

full_list=( "backprop" "cfd" "gaussian" "heartwall" "hotspot" "hotspot3D" "lavaMD" "myocyte" "nn" "particlefilter" "srad" "streamcluster")

options=()

while [ "$1" != "" ]
do
  if [ "$1" = "all" ]
  then
    for i in "${full_list[@]}"
    do
      benchmark "$i"
      sleep 10
    done
    exit 0
  fi
  options+=( "$1" )
  shift
done

for i in "${options[@]}"
do
  benchmark "$i"
  sleep 10
done
