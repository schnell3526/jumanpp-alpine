FROM alpine:latest

RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache --update --virtual=build-deps add \
    build-base \
    boost-dev \
    libexecinfo-dev \
    linux-headers \
    g++ \
    make \
    protobuf-dev \
    protobuf \
    eigen-dev \
    automake \
    autoconf \
    cmake \
    wget && \
    ln -s /usr/include/linux/sysctl.h /usr/include/sys/sysctl.h

ENV LANG=C.UTF-8 \
    JUMANPP_VERSION=2.0.0-rc3

WORKDIR /tmp/src

RUN wget https://github.com/ku-nlp/jumanpp/releases/download/v${JUMANPP_VERSION}/jumanpp-${JUMANPP_VERSION}.tar.xz && \
    tar Jxvf jumanpp-${JUMANPP_VERSION}.tar.xz && \
    cd jumanpp-${JUMANPP_VERSION} && \
    mkdir bld && \
    cd bld && \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local && \
    make install -j4 && \
    rm -rf /tmp/src && \
    apk del build-deps && \
    apk --no-cache add libstdc++

WORKDIR /workdir

CMD [ "jumanpp" ]