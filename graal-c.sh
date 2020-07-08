 export LLVM_TOOLCHAIN=$(lli --print-toolchain-path)
 $LLVM_TOOLCHAIN/clang $1 -o tmp_app
 lli tmp_app
