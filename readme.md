## Installations

#### 소스 가져오기 
```bat
git submodule add https://github.com/grpc/grpc.git third_party/grpc
cd third_party/grpc
git submodule update --init --recursive
```

#### 빌드 & 설치 
```
cd third_party/grpc
mkdir build && cd build

cmake -G "Visual Studio 17 2022" -DCMAKE_CXX_STANDARD=17 .. -DCMAKE_INSTALL_PREFIX=..\install

cmake --build . --config Release --target install # 30분에서 1시간 이상 걸릴 수 있음
```


#### Props 세팅
보기 -> 다른 창 -> 속성 관리자

프로젝트 우클릭 -> 기존 속성 시트 추가  
/gRPC-PropertySheet/gRPC.props 추가


### Unity에서의 HTTP/2 사용
https://github.com/Cysharp/YetAnotherHttpHandler 참고
