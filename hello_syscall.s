#
# An entry level example of an assembly program
# Compiling for mac OS:
# as hello_syscall.s -o hello_syscall.o -arch x86_64
# linking: ld hello_syscall.o -e _main -o hello_syscall -macosx_version_min 12.2 -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem
# acknowledgments:
#   https://github.com/GaetanoCausio/AssemblerOnMac,
#   http://www.idryman.org/blog/2014/12/02/writing-64-bit-assembly-on-mac-os-x/
#  

.section __TEXT,__text

.global _main
_main:
  movl $0x2000004, %eax # set system call #4 (write)
  movl $1, %edi         # file descriptor 1 is a standard output
  movq hello_string@GOTPCREL(%rip), %rsi 
  movq $str_size, %rdx
  syscall

  movl $0, %ebx
  movl $0x2000001, %eax
  syscall

  .section __DATA,__data
hello_string:
  .asciz "Hello world!\n"
  .set str_size, .-hello_string




