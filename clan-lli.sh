SRC=$1.c
 export LLVM_TOOLCHAIN=$(lli --print-toolchain-path)
 $LLVM_TOOLCHAIN/clang $1 -o $1
 lli $1
