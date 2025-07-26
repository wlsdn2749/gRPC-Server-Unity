pushd %~dp0

REM Proto 파일들 생성
set PROTOC="../third_party\grpc\install\bin\protoc.exe"
set GRPC_PLUGIN_CPP="../third_party\grpc\install\bin\grpc_cpp_plugin.exe"
set GRPC_PLUGIN_CS="../third_party\grpc\install\bin\grpc_csharp_plugin.exe"
set OUT_DIR_CPP="./"
set OUT_DIR_CS="./"

%PROTOC% --cpp_out=%OUT_DIR_CPP% --grpc_out=%OUT_DIR_CPP% --plugin=protoc-gen-grpc=%GRPC_PLUGIN_CPP% ./route_guide.proto
%PROTOC% --cpp_out=%OUT_DIR_CPP% --grpc_out=%OUT_DIR_CPP% --plugin=protoc-gen-grpc=%GRPC_PLUGIN_CPP% ./helloworld.proto

%PROTOC% --csharp_out=%OUT_DIR_CS% --grpc_out=%OUT_DIR_CS% --plugin=protoc-gen-grpc=%GRPC_PLUGIN_CS% ./route_guide.proto
%PROTOC% --csharp_out=%OUT_DIR_CS% --grpc_out=%OUT_DIR_CS% --plugin=protoc-gen-grpc=%GRPC_PLUGIN_CS% ./helloworld.proto


IF ERRORLEVEL 1 PAUSE

XCOPY /Y route_guide.grpc.pb.cc "../Generated/cpp"
XCOPY /Y route_guide.grpc.pb.h "../Generated/cpp"
XCOPY /Y route_guide.pb.cc "../Generated/cpp"
XCOPY /Y route_guide.pb.h "../Generated/cpp"

XCOPY /Y helloworld.grpc.pb.cc "../Generated/cpp"
XCOPY /Y helloworld.grpc.pb.h "../Generated/cpp"
XCOPY /Y helloworld.pb.cc "../Generated/cpp"
XCOPY /Y helloworld.pb.h "../Generated/cpp"

XCOPY /Y helloworld.cs "../../gRPC-client\Assets\Scripts\Protocol"
XCOPY /Y helloworldGrpc.cs "../../gRPC-client\Assets\Scripts\Protocol"


DEL /Q /F *.pb.h
DEL /Q /F *.pb.cc
DEL /Q /F *.h
DEL /Q /F *.cc

DEL /Q /F *.cs

PAUSE