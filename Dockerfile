FROM oracle/graalvm-ce

RUN  gu install llvm-toolchain \
   &&  gu install python \
   &&  gu install native-image

COPY *.sh /APP/
WORKDIR /APP

CMD ls /bin/
