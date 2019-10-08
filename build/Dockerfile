#FROM quay.io/pypa/manylinux1_x86_64
FROM alpine:3.9
COPY src/ /buildme
RUN apk add make cmake gcc musl-dev nasm
RUN cd /buildme && cmake -G"Unix Makefiles" . && make

