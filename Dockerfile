FROM ubuntu:16.04
RUN apt-get update && apt-get upgrade -y && apt-get install build-essential curl wget cmake docker.io -y
RUN cd /tmp && wget https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz && tar xf go1.8.1.linux-amd64.tar.gz
RUN cd /tmp/go && mv bin/* /usr/bin
RUN mv /tmp/go /usr/local/go
RUN apt-get -y install libglibmm-2.4-1v5 libglibmm-2.4-dev libxml++2.6-dev libgnutls-openssl-dev libssl-dev
RUN cd /tmp && wget -c "https://github.com/google/benchmark/archive/v1.1.0.tar.gz" && tar xvf v1.1.0.tar.gz
RUN cd /tmp/benchmark-1.1.0 && mkdir build && cd build && cmake .. && make && make install
RUN cd /tmp && wget -c "https://github.com/google/protobuf/releases/download/v3.2.0/protobuf-cpp-3.2.0.tar.gz" && tar xvf protobuf-cpp-3.2.0.tar.gz
RUN cd /tmp/protobuf-3.2.0 && ./configure --prefix=/usr && make && make install
RUN cd /tmp && wget -c "https://github.com/grpc/grpc/archive/v1.2.3.tar.gz" && tar xvf v1.2.3.tar.gz
RUN cd /tmp/grpc-1.2.3 && make && make install
CMD ["/bin/bash"]

