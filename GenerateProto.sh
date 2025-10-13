#!/bin/bash
echo "** Generating Protocol Buffers **"

protoc --plugin=protoc-gen-eams=./protoc-gen-eams --eams_out=_C++ *.proto
protoc --python_out=_Python *.proto
protoc --grpc_python_out=PythonTestProject --grpcio_python_out=PythonTestProject *.proto

echo "** C++ File Cleanup **"
cd _C++ || exit
rm *.hpp
for f in *.h; do mv "$f" "${f%.h}.hpp"; done

echo.
echo "** Done! **"
read -p "Press Enter to continue..."