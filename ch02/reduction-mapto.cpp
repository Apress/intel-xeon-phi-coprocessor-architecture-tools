// Copyright (c) 2013, Rezaur Rahman
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
//  * Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//  * Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in the
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




// Sample code reduction.cpp
// Example showing use of OpenMP 4.0 pragmas for offload calculation
// Following syntax is supported on  Intel(R) Compiler (Intel(R) Composer XE 2013)

#include <stdio.h>

#define SIZE 1000
#pragma omp declare target 
int reduce(int *inarray)
{
     
   int   sum=0;
   #pragma omp target mapto( inarray[0:SIZE]) map(sum)
   {
      for(int i=0;i<SIZE;i++)
        sum += inarray[i];
   }
  return sum;
}

int main()
{
   int inarray[SIZE], sum, validSum;

   validSum=0;
   for(int i=0; i<SIZE; i++){
     inarray[i]=i;
     validSum+=i;
   }

   sum=0;
   sum = reduce(inarray);

   printf("sum reduction = %d, validSum=%d\n",sum, validSum);
}
