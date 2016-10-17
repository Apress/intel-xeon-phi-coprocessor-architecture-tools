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


#define SIZE    (180*1024*1000)
#define ITER       20

__declspec(align(256)) static double  a[SIZE],  b[SIZE],   c[SIZE];


extern double elapsedTime (void);

int main()
{
	double startTime,  duration;
	int i, j;

	//initialize arrays
	#pragma omp parallel for
	for (i=0; i<SIZE;i++)
	{
   		c[i]=0.0f; 
                b[i]=a[i]=(double)1.0f;
	}

        //measure c = a*b+c performance
	startTime = elapsedTime(); 
  	for(i=0; i<ITER;i++) {
        #pragma omp parallel for
           for( j=0; j<SIZE;j++){
             c[j]=a[j]*b[j]+c[j];
           }
  	}
	duration = elapsedTime() - startTime;

  	double GB = SIZE*sizeof(double)/1e+9;
        double GBps = 4*ITER*GB/duration;
        printf("Running %d openmp threads\n", omp_get_max_threads());
        printf("DP ArraySize =  %lf MB, GB/s = %lf\n", GB*1000, GBps);

  return 0;
}


