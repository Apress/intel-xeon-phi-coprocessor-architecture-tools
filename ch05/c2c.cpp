/*
// Program: bw
// Original Code developed by : Rezaur Rahman
// 
// Copyright (c) 2013, Rezaur Rahman
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
//  * Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//  * Redistributions in binary form must reproduce the above copyright
//    documentation and/or other materials provided with the distribution.
//  * Neither the name of Oak Ridge National Laboratory, nor UT-Battelle, LLC,
//    nor the names of its contributors may be used to endorse or promote
//    products derived from this software without specific prior written
//    permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
// OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
// THE POSSIBILITY OF SUCH DAMAGE.
//
//
*/
#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

#define NUM_THREADS 60
#define SIZE    (NUM_THREADS*512*1024)
#define ITER       200
#define CACHE_LINE_SZ 64

__declspec(align(256)) static double  a[SIZE],  b[SIZE],   c[SIZE];


extern double elapsedTime (void);

int main()
{
	double startTime,  duration;
	int i, j,k;

	//initialize arrays
	#pragma omp parallel for
	for (i=0; i<SIZE;i++)
	{
   		c[i]=0.0f; 
                b[i]=a[i]=(double)1.0f;
	}

        omp_set_num_threads(NUM_THREADS);
        //measure c2c transfer perofrmance by reading data of thread 2 from thread 1 
        int numThreads = omp_get_max_threads();
printf("runing with %d threads\n",numThreads);
        int myId=0;
        int BlkSize = SIZE/numThreads;
	startTime = elapsedTime(); 
        
  	for(i=0; i<ITER;i++) {
          for(k=1;k<numThreads/4;k++)
        #pragma omp master
           for( j=0; j<SIZE/numThreads;j+=CACHE_LINE_SZ){
             c[j]=a[j+BlkSize*k];
           }
  	}
	duration = elapsedTime() - startTime;

  	double GB = (SIZE-BlkSize)*sizeof(double)/1e+9/4;
        double GBps = ITER*GB/duration;
        double AvgLatency = 1.0/GBps;
        printf("Running %d openmp threads\n", omp_get_max_threads());
        printf("DP ArraySize =  %lf MB, C2C GB/s = %lf C2CLatency=%lfns \n", GB*1000, GBps,AvgLatency);

  return 0;
}


