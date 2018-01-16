                .SECTION FAT

`FAT entry: CURXMFL`:
                .FAT  entry_CURXMFL
              
                .PUBLIC `FAT entry: CURXMFL`
              
                .SECTION Code
;;; Copied from the RAMPAGE rom (function "WORKFL"), originally from the NEXT rom
;;; No input, current XM working file appended to Alpha

                .NAME "CURXMFL"
entry_CURXMFL:   B=0 S        ; 03E B=0 MS     ; any file type
			     GOSUB 0x3c96 ; 259 ?NC XQ     ; Current File Data
			                  ; 0F0 ->3C96     ; [CURFLD]
			     ACEX         ; 0AE A<>C ALL   ; header reg to C
			     RCR 8        ; 13C RCR 8      ; get file adr to C[S&X]
			     DADD=C       ; 270 RAMSLCT    ; select register
			     C=DATA       ; 038 READATA    ; read file name
			     N=C          ; 070 N=C ALL    ; save it in N
			     C=0 X        ; 046 C=0 S&X    ;  
			     DADD=C       ; 270 RAMSLCT    ; Select Chip0
			     LDI ' '      ; 130 LDI S&X    ;  
			                  ; 020 " "        ; space chr
			     BCEX X       ; 0E6 B<>C S&X   ; put in B[S&X] for compares
			     PT= 13       ; 2DC PT= 13     ; 
			     LC 6         ; 190 LD@PT- 6   ; maximum chars = 7
			     PT= 0        ; 39C PT= 0      ; 
			     BCEX S       ; 0FE B<>C MS    ; loop# to B[MS]
			     C=N          ; 0B0 C=N ALL    ; file name
			     RCR 12       ; 37C RCR 12     ; rotate 2 left
			     N=C          ; 070 N=C ALL    ; update N
			     C=0 XS       ; 056 C=0 XS     ; 
			     ABEX X       ; 066 A<>B S&X   ; put "020" in A[S&X]
			     B=A X        ; 086 B=A S&X    ; keep it in B[S&X]
			     ?A#C X       ; 366 ?A#C S&X   ; blank space?
			     RTNNC        ; 3A0 ?NC RTN    ; yes, done!
			     G=C          ; 058 G=C @PT,+  ; no, add it to Alpha
			     GOSUB 0x2d14 ; 051 ?NC XQ     ; 
			                  ; 0B4 ->2D14     ; [APNDNW]   
			     C=B S        ; 0DE C=B MS     ; check safety
			     C=C-1 S      ; 27E C=C-1 MS   ; did all loops?
			     GOTO .-14    ; 393 JNC  -14   ; no, do next -> [LB_A856]  
			     RTN          ; 3E0 RTN        ; yes, done. 
 

