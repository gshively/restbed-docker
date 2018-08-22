FROM amazonlinux AS builder
RUN  yum install -y cmake nginx git gcc gcc-c++ make
RUN  mkdir -p /src/cmake
RUN  cd /src/cmake && curl -O https://cmake.org/files/v3.10/cmake-3.10.0.tar.gz
RUN  yum install -y tar
RUN  cd /src/cmake && tar xf cmake-3.10.0.tar.gz && cd cmake-3.10.0 && ./bootstrap && make && make install
RUN  rpm -e cmake
RUN  git clone --recursive https://github.com/corvusoft/restbed.git /src/restbed
RUN  yum install -y openssl-devel openssl
RUN  mkdir -p /src/restbed/build
RUN  cd /src/restbed/build && cmake -DBUILD_SSL=NO .. && make
