icpc -no-opt-prefetch -mcmodel=medium -O3  -mmic  -openmp -vec-report3  bw.cpp gettime.cpp -o bw.out
icpc -opt-report-phase=hlo -opt-prefetch  -mcmodel=medium -O3  -mmic   -vec-report3  gather.cpp gettime.cpp -o gather.out
icpc -no-opt-prefetch -mcmodel=medium -O3  -mmic  -openmp -vec-report3  c2c.cpp gettime.cpp -o c2c.out


