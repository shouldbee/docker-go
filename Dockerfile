FROM ubuntu:14.04

RUN apt-get update -y
RUN apt-get install -y mercurial git curl build-essential

# Install go
RUN curl --insecure https://storage.googleapis.com/golang/go1.3.linux-amd64.tar.gz | tar -C /usr/local -zx

ENV GOROOT /usr/local/go
ENV PATH /usr/local/go/bin:$PATH
# Setup home environment
RUN useradd golang
RUN mkdir /home/golang && chown -R golang /home/golang
RUN mkdir -p /home/golang/go /home/golang/bin /home/golang/lib /home/golang/include
ENV PATH /home/golang/bin:/home/golang/go/bin:$PATH
ENV PKG_CONFIG_PATH /home/golang/lib/pkgconfig
ENV LD_LIBRARY_PATH /home/golang/lib
ENV GOPATH /home/golang/go:$GOPATH

WORKDIR /home/golang
ENV HOME /home/golang

RUN chown -R golang /home/golang
USER golang
