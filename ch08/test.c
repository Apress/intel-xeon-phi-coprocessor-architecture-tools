


int main()
{
   printf("y = %d\n", f()); 
}


int f()
{
  int x=1, y=3;
  #pragma offload target(mic)
  {
      #ifdef __MIC__
          y = x;
      #endif
          y++;
  }

return y;
}

