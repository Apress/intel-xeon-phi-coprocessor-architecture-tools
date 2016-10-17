/*
// Program: gather
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

#define SIZE  1000000 
#define ITER       20


typedef struct pointVal { 
              double x, y, z; 
              double value; 
}POINT; 

__declspec(align(256)) static POINT  a[SIZE];

extern double elapsedTime (void);

int main()
{
	double startTime, duration, tmp[SIZE];
	int i, j;
//initialize
          for( j=0; j<SIZE;j++){
              a[j].x=0.1;
           }
                                                   
       startTime = elapsedTime();

  	for(i=0; i<ITER;i++) {
           for( j=0; j<SIZE;j++){
             tmp[j]+=a[j].x;
           }
  	}
        duration = elapsedTime()-startTime;

        double MB = SIZE*sizeof(double)/1e+6;
        double MBps = ITER*MB/duration;
        printf("DP ArraySize =  %lf MB, MB/s = %lf\n", MB, MBps);

  return 0;
}

