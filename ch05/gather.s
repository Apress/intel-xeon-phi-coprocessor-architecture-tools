	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) MIC Architecture, Version 13.1.3.192";
# mark_description " Build 20130607";
# mark_description "-opt-report-phase=hlo -mmic -vec-report3 -O3 -c -S -unroll0";
	.file "gather.cpp"
	.text
..TXTST0:
L__routine_start_main_0:
# -- Begin  main
# mark_begin;
# Threads 4
        .align    16,0x90
	.globl main
main:
..B1.1:                         # Preds ..B1.0 Latency 5
..___tag_value_main.1:                                          #51.1
..LN0:
  .file   1 "gather.cpp"
   .loc    1  51  is_stmt 1
        pushq     %rbp                                          #51.1
..___tag_value_main.3:                                          #
..LN1:
        movq      %rsp, %rbp                                    #51.1
..___tag_value_main.4:                                          #
..LN2:
        andq      $-128, %rsp                                   #51.1
..LN3:
        subq      $8000000, %rsp                                #51.1 c1
..LN4:
        movl      $3, %edi                                      #51.1 c1
..___tag_value_main.6:                                          #51.1
..LN5:
        call      __intel_new_proc_init_R                       #51.1
..___tag_value_main.7:                                          #
..LN6:
                                # LOE rbx r12 r13 r14 r15
..B1.13:                        # Preds ..B1.1 Latency 35
..LN7:
        stmxcsr   (%rsp)                                        #51.1 c1
..LN8:
   .loc    1  56  is_stmt 1
        vprefetch0 a(%rip)                                      #56.15 c2
..LN9:
   .loc    1  51  is_stmt 1
        orl       $32832, (%rsp)                                #51.1 c6
        movl      $255, %ecx                                    # c6
..LN10:
   .loc    1  56  is_stmt 1
        vprefetch0 256+a(%rip)                                  #56.15 c10
..LN11:
   .loc    1  51  is_stmt 1
        ldmxcsr   (%rsp)                                        #51.1 c14
..LN12:
   .loc    1  56  is_stmt 1
        vprefetch0 512+a(%rip)                                  #56.15 c15
..LN13:
        vprefetch0 768+a(%rip)                                  #56.15 c19
..LN14:
        vbroadcastsd .L_2il0floatpacket.1(%rip), %zmm1          #56.22 c23
        vmovapd   .L_2il0floatpacket.2(%rip), %zmm0             # c27
..LN15:
   .loc    1  55  is_stmt 1
        xorl      %edx, %edx                                    #55.11 c31
        xorl      %eax, %eax                                    # c31
        kmov      %ecx, %k2                                     # c35
        .align    16,0x90
..LN16:
                                # LOE rax rdx rbx r12 r13 r14 r15 zmm0 zmm1 k2
..B1.2:                         # Preds ..B1.2 ..B1.13 Latency 25
..LN17:
   .loc    1  56  is_stmt 1
        kmov      %k2, %k1                                      #56.15 c1
..LN18:
   .loc    1  55  is_stmt 1
        addq      $8, %rdx                                      #55.11 c1
..LN19:
   .loc    1  56  is_stmt 1
        vprefetch1 2048+a(%rax)                                 #56.15 c5
..L9:                                                           #56.15
..LN20:
        vscatterdpd %zmm1, a(%rax,%zmm0){%k1}                   #56.15
..LN21:
        jkzd      ..L8, %k1     # Prob 50%                      #56.15
..LN22:
        vscatterdpd %zmm1, a(%rax,%zmm0){%k1}                   #56.15
..LN23:
        jknzd     ..L9, %k1     # Prob 50%                      #56.15
..L8:                                                           #
..LN24:
        vprefetch0 1024+a(%rax)                                 #56.15 c17
..LN25:
   .loc    1  55  is_stmt 1
        addq      $256, %rax                                    #55.11 c21
..LN26:
        cmpq      $1000000, %rdx                                #55.11 c25
..LN27:
        jb        ..B1.2        # Prob 99%                      #55.11 c25
..LN28:
                                # LOE rax rdx rbx r12 r13 r14 r15 zmm0 zmm1 k2
..B1.3:                         # Preds ..B1.2 Latency 1
..___tag_value_main.10:                                         #59.20
..LN29:
   .loc    1  59  is_stmt 1
        call      _Z11elapsedTimev                              #59.20
..___tag_value_main.11:                                         #
..LN30:
                                # LOE rbx r12 r13 r14 r15 zmm0
..B1.14:                        # Preds ..B1.3 Latency 1
..LN31:
        vmovapd   %zmm0, %zmm2                                  #59.20 c1
..LN32:
                                # LOE rbx r12 r13 r14 r15 zmm2
..B1.4:                         # Preds ..B1.14 Latency 9
..LN33:
   .loc    1  61  is_stmt 1
        movl      $255, %edx                                    #61.4 c1
..LN34:
        movb      $0, %al                                       #61.4 c1
..LN35:
        vmovapd   .L_2il0floatpacket.2(%rip), %zmm1             #61.4 c5
..LN36:
        kmov      %edx, %k1                                     #61.4 c9
..LN37:
                                # LOE rbx r12 r13 r14 r15 al zmm1 zmm2 k1
..B1.5:                         # Preds ..B1.7 ..B1.4 Latency 21
..LN38:
   .loc    1  62  is_stmt 1
        xorl      %ecx, %ecx                                    #62.12 c1
..LN39:
   .loc    1  63  is_stmt 1
        vprefetch0 (%rsp)                                       #63.14 c1
..LN40:
        vprefetch0 64(%rsp)                                     #63.14 c5
        xorl      %edx, %edx                                    # c5
..LN41:
        vprefetch0 128(%rsp)                                    #63.14 c9
..LN42:
        movb      %al, %al                                      #63.14 c9
..LN43:
        vprefetch0 192(%rsp)                                    #63.14 c13
..LN44:
        movb      %al, %al                                      #63.22 c13
..LN45:
        vprefetch0 a(%rip)                                      #63.22 c17
..LN46:
        vprefetch0 256+a(%rip)                                  #63.22 c21
        .align    16,0x90
..LN47:
                                # LOE rdx rcx rbx r12 r13 r14 r15 al zmm1 zmm2 k1
..B1.6:                         # Preds ..B1.6 ..B1.5 Latency 33
..LN48:
        kmov      %k1, %k2                                      #63.22 c1
..LN49:
        vprefetche1 512(%rsp,%rcx,8)                            #63.14 c1
..L13:                                                          #63.22
..LN50:
        vgatherdpd a(%rdx,%zmm1), %zmm3{%k2}                    #63.22
..LN51:
        jkzd      ..L12, %k2    # Prob 50%                      #63.22
..LN52:
        vgatherdpd a(%rdx,%zmm1), %zmm3{%k2}                    #63.22
..LN53:
        jknzd     ..L13, %k2    # Prob 50%                      #63.22
..L12:                                                          #
..LN54:
        vaddpd    (%rsp,%rcx,8), %zmm3, %zmm4                   #63.14 c13
..LN55:
        vprefetch0 256(%rsp,%rcx,8)                             #63.14 c13
..LN56:
        vprefetch1 2048+a(%rdx)                                 #63.22 c17
..LN57:
        vmovapd   %zmm4, (%rsp,%rcx,8)                          #63.14 c21
..LN58:
   .loc    1  62  is_stmt 1
        addq      $8, %rcx                                      #62.12 c21
..LN59:
   .loc    1  63  is_stmt 1
        vprefetch0 1024+a(%rdx)                                 #63.22 c25
..LN60:
   .loc    1  62  is_stmt 1
        addq      $256, %rdx                                    #62.12 c29
..LN61:
        cmpq      $1000000, %rcx                                #62.12 c33
..LN62:
        jb        ..B1.6        # Prob 99%                      #62.12 c33
..LN63:
                                # LOE rdx rcx rbx r12 r13 r14 r15 al zmm1 zmm2 k1
..B1.7:                         # Preds ..B1.6 Latency 5
..LN64:
   .loc    1  61  is_stmt 1
        incb      %al                                           #61.4 c1
..LN65:
        cmpb      $20, %al                                      #61.4 c5
..LN66:
        jb        ..B1.5        # Prob 89%                      #61.4 c5
..LN67:
                                # LOE rbx r12 r13 r14 r15 al zmm1 zmm2 k1
..B1.8:                         # Preds ..B1.7 Latency 13
..LN68:
   .loc    1  66  is_stmt 1
        movl      $1, %eax                                      #66.20 c1
..LN69:
        kmov      %eax, %k1                                     #66.20 c5
..LN70:
        vpackstorelpd %zmm2, (%rsp){%k1}                        #66.20 c9
..___tag_value_main.14:                                         #66.20
..LN71:
        call      _Z11elapsedTimev                              #66.20
..___tag_value_main.15:                                         #
..LN72:
                                # LOE rbx r12 r13 r14 r15 zmm0
..B1.15:                        # Preds ..B1.8 Latency 1
        vbroadcastsd (%rsp), %zmm2                              # c1
..LN73:
                                # LOE rbx r12 r13 r14 r15 zmm0 zmm2
..B1.9:                         # Preds ..B1.15 Latency 157
..LN74:
   .loc    1  70  is_stmt 1
        vbroadcastsd .L_2il0floatpacket.4(%rip), %zmm3          #70.9 c1
..LN75:
        vbroadcasti32x4 .L_2il0floatpacket.7(%rip), %zmm14      #70.9 c5
..LN76:
        vbroadcasti64x4 .L_2il0floatpacket.5(%rip), %zmm20      #70.9 c9
..LN77:
        vpxorq    %zmm5, %zmm5, %zmm5                           #70.9 c13
..LN78:
        movl      $1, %eax                                      #70.9 c13
..LN79:
        vpbroadcastd .L_2il0floatpacket.8(%rip), %zmm4          #70.9 c17
..LN80:
        vmovapd   %zmm20{bbbb}, %zmm8                           #70.9 c21
..LN81:
        kmov      %eax, %k3                                     #70.9 c21
..LN82:
        vsubpd    %zmm2, %zmm0, %zmm2{%k3}                      #70.9 c25
..LN83:
        movl      $.L_2__STRING.0, %edi                         #70.9 c25
..LN84:
        vgetexppd %zmm2, %zmm11{%k3}                            #70.9 c29
..LN85:
        movl      $2, %eax                                      #70.9 c29
..LN86:
        vgetexppd %zmm3, %zmm10{%k3}                            #70.9 c33
..LN87:
        vgetmantpd $0, %zmm2, %zmm9{%k3}                        #70.9 c37
..LN88:
        vsubpd    %zmm11, %zmm10, %zmm12{%k3}                   #70.9 c41
..LN89:
        vpminsd   %zmm14{aaaa}, %zmm12, %zmm13                  #70.9 c45
..LN90:
        vcvtpd2ps {rz-sae}, %zmm9, %zmm6{%k3}                   #70.9 c49
..LN91:
        vpminud   %zmm14{bbbb}, %zmm13, %zmm15                  #70.9 c53
..LN92:
        vrcp23ps  %zmm6, %zmm7{%k3}                             #70.9 c57
..LN93:
        vaddpd    %zmm20{cccc}, %zmm15, %zmm15{%k3}             #70.9 c57
..LN94:
        vfixupnanpd %zmm4, %zmm2, %zmm5{%k3}                    #70.9 c61
..LN95:
        vcvtps2pd %zmm7, %zmm22{%k3}                            #70.9 c65
..LN96:
        vpslld    $20, %zmm15, %zmm17                           #70.9 c69
..LN97:
        vbroadcasti64x4 .L_2il0floatpacket.6(%rip), %zmm16      #70.9 c73
..LN98:
        vfixupnanpd %zmm4, %zmm3, %zmm5{%k3}                    #70.9 c77
..LN99:
        vfnmadd213pd {rn-sae}, %zmm8, %zmm22, %zmm9{%k3}        #70.9 c81
..LN100:
        vpsrad    $1, %zmm17, %zmm24                            #70.9 c85
..LN101:
        vcmpeqpd  %zmm5, %zmm5, %k2{%k3}                        #70.9 c89
..LN102:
        vfmadd231pd {rn-sae}, %zmm9, %zmm9, %zmm9{%k3}          #70.9 c93
..LN103:
        vpandq    %zmm16{aaaa}, %zmm24, %zmm24{%k3}             #70.9 c97
..LN104:
        kmov      %k2, %k1                                      #70.9 c97
..LN105:
        vpbroadcastd .L_2il0floatpacket.9(%rip), %zmm23         #70.9 c101
..LN106:
        vfmadd231pd {rn-sae}, %zmm22, %zmm9, %zmm22{%k3}        #70.9 c105
..LN107:
        kandn     %k3, %k1                                      #70.9 c105
..LN108:
        vgetmantpd $0, %zmm3, %zmm21{%k3}                       #70.9 c109
..LN109:
        vpsubd    %zmm24, %zmm17, %zmm18                        #70.9 c113
..LN110:
        vmovdqa64 %zmm20{bbbb}, %zmm19                          #70.9 c117
..LN111:
        vfixupnanpd %zmm23, %zmm2, %zmm2{%k3}                   #70.9 c121
..LN112:
        vmulpd    {rn-sae}, %zmm22, %zmm21, %zmm27{%k2}         #70.9 c125
..LN113:
        vpaddd    %zmm19, %zmm18, %zmm26                        #70.9 c129
..LN114:
        vmulpd    {rn-sae}, %zmm2, %zmm3, %zmm27{%k1}           #70.9 c133
..LN115:
        vpandq    %zmm20{aaaa}, %zmm26, %zmm26{%k3}             #70.9 c137
..LN116:
        vpaddd    %zmm24, %zmm27, %zmm25                        #70.9 c141
..LN117:
        vmulpd    {rn}, %zmm26, %zmm25, %zmm27{%k2}             #70.9 c145
..LN118:
        vmovapd   %zmm27, %zmm1{%k3}                            #70.9 c149
..LN119:
        vbroadcastsd .L_2il0floatpacket.3(%rip), %zmm0          #70.9 c153
..___tag_value_main.16:                                         #70.9
..LN120:
        call      printf                                        #70.9
..___tag_value_main.17:                                         #
..LN121:
                                # LOE rbx r12 r13 r14 r15
..B1.10:                        # Preds ..B1.9 Latency 5
..LN122:
   .loc    1  72  is_stmt 1
        xorl      %eax, %eax                                    #72.10 c1
..LN123:
        movq      %rbp, %rsp                                    #72.10 c5
..LN124:
        popq      %rbp                                          #72.10
..___tag_value_main.18:                                         #
..LN125:
        ret                                                     #72.10
        .align    16,0x90
..___tag_value_main.20:                                         #
..LN126:
                                # LOE
..LN127:
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.128:
.LNmain:
	.data
# -- End  main
	.bss
	.align 256
	.align 256
a:
	.type	a,@object
	.size	a,32000000
	.space 32000000	# pad
	.section .rodata, "a"
	.align 64
	.align 64
.L_2il0floatpacket.2:
	.long	0x00000000,0x00000020,0x00000040,0x00000060,0x00000080,0x000000a0,0x000000c0,0x000000e0,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,64
	.align 32
.L_2il0floatpacket.5:
	.long	0x00000000,0x7ff00000,0x00000000,0x3ff00000,0x00000000,0x41380000,0x00000000,0x4137fc02
	.type	.L_2il0floatpacket.5,@object
	.size	.L_2il0floatpacket.5,32
	.align 32
.L_2il0floatpacket.6:
	.long	0x00000000,0xfff00000,0x00000001,0x00000000,0x0000043e,0x00000000,0x00000000,0x80000000
	.type	.L_2il0floatpacket.6,@object
	.size	.L_2il0floatpacket.6,32
	.align 16
.L_2il0floatpacket.7:
	.long	0x40900800,0xc090d400,0x7fe00000,0x03500000
	.type	.L_2il0floatpacket.7,@object
	.size	.L_2il0floatpacket.7,16
	.align 8
.L_2il0floatpacket.1:
	.long	0x9999999a,0x3fb99999
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,8
	.align 8
.L_2il0floatpacket.3:
	.long	0x00000000,0x40200000
	.type	.L_2il0floatpacket.3,@object
	.size	.L_2il0floatpacket.3,8
	.align 8
.L_2il0floatpacket.4:
	.long	0x00000000,0x40640000
	.type	.L_2il0floatpacket.4,@object
	.size	.L_2il0floatpacket.4,8
	.align 4
.L_2il0floatpacket.8:
	.long	0x00028b45
	.type	.L_2il0floatpacket.8,@object
	.size	.L_2il0floatpacket.8,4
	.align 4
.L_2il0floatpacket.9:
	.long	0x00018842
	.type	.L_2il0floatpacket.9,@object
	.size	.L_2il0floatpacket.9,4
	.section .rodata.str1.32, "aMS",@progbits,1
	.align 32
	.align 4
.L_2__STRING.0:
	.byte	68
	.byte	80
	.byte	32
	.byte	65
	.byte	114
	.byte	114
	.byte	97
	.byte	121
	.byte	83
	.byte	105
	.byte	122
	.byte	101
	.byte	32
	.byte	61
	.byte	32
	.byte	32
	.byte	37
	.byte	108
	.byte	102
	.byte	32
	.byte	77
	.byte	66
	.byte	44
	.byte	32
	.byte	77
	.byte	66
	.byte	47
	.byte	115
	.byte	32
	.byte	61
	.byte	32
	.byte	37
	.byte	108
	.byte	102
	.byte	10
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,36
	.data
	.section .note.GNU-stack, ""
# End
