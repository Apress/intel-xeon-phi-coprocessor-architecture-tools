/*
// Program: pcibw
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

//Define number of floats for 64 MB data transfer
#define SIZE (64*1000*1000/sizeof(float))   
#define ITER    10
// set cache line size alignment
#define ALIGN   (64)
__declspec(target(MIC)) static float  *a;
extern double elapsedTime (void);
int main()
{
	double startTime,  duration;
	int i, j;

        //allocate a
        a = (float*)_mm_malloc(SIZE*sizeof(float),ALIGN);

	//initialize arrays
	#pragma omp parallel for
	for (i=0; i<SIZE;i++)
	{
                a[i]=(float)1.0f;
	}
        // Allocate memory on the card
        #pragma offload target(mic) \
          in(a:length(SIZE) free_if(0) alloc_if(1) align(ALIGN) )
        {
        }
        
	startTime = elapsedTime(); 
  	for(i=0; i<ITER;i++) {
            //transfer data over the PCI express bus
           #pragma offload target(mic) \
            in(a:length(SIZE) free_if(0) alloc_if(0) align(ALIGN) )
            {}
        }
	duration = elapsedTime() - startTime;

	// free memory on the card
  	#pragma offload target(mic) \
    		in(a:length(SIZE) alloc_if(0) free_if(1) )
    	{
    	}

//free the host system memory
	_mm_free(a);

  	double GB = SIZE*sizeof(float)/(1000.0*1000.0*1000.0);
        double GBps = ITER*GB/duration;
        printf("SP ArraySize =  %0.4lf MB, ALIGN=%dB, PCIe Data transfer bandwidth Host->Device  GB/s = %0.2lf\n", GB*1000.0, ALIGN,  GBps);

  return 0;
}


