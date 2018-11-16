call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat" x64

set cc=cl
set cxx=cl

set BuidDir=build
set InstallDir=install

CMake -GNinja -H.\llvm -B.\%BuidDir% -DCMAKE_INSTALL_PREFIX=%InstallDir% -DCMAKE_BUILD_TYPE=debug -DLLVM_TARGETS_TO_BUILD=X86 -DLLVM_ABI_BREAKING_CHECKS=FORCE_OFF -DLLVM_ENABLE_WARNINGS=OFF -DLLVM_ENABLE_CXX1Z=ON -DLLVM_INCLUDE_EXAMPLES=OFF -DLLVM_INCLUDE_TESTS=OFF -DLLVM_INCLUDE_DOCS=OFF -DLLVM_INCLUDE_TOOLS=OFF -DLLVM_ENABLE_PDB=ON

CMake --build .\%BuidDir% --target install
