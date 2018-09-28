FROM haproxy:1.8.14

# https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
ARG TIME_ZONE

RUN mkdir -p /opt/etc && \
    cp -a --parents /usr/local/etc/haproxy /opt && \
    cp -a --parents /usr/local/sbin/haproxy /opt && \
    cp -a --parents /lib/x86_64-linux-gnu/libz.so.* /opt && \
    cp -a --parents /lib/x86_64-linux-gnu/libdl.so.* /opt && \
    cp -a --parents /lib/x86_64-linux-gnu/libpthread.so.* /opt && \
    cp -a --parents /lib/x86_64-linux-gnu/libm.so.* /opt && \
    cp -a --parents /lib/x86_64-linux-gnu/libpcre.so.* /opt && \
    cp -a --parents /lib/x86_64-linux-gnu/libc.so.* /opt && \
    cp -a --parents /usr/lib/x86_64-linux-gnu/libssl.so.* /opt && \
    cp -a --parents /usr/lib/x86_64-linux-gnu/libcrypto.so.* /opt && \
    cp -a --parents /usr/lib/x86_64-linux-gnu/liblua5.3.so.* /opt && \
    cp -a --parents /usr/lib/x86_64-linux-gnu/libpcreposix.so.* /opt && \
    cp /usr/share/zoneinfo/${TIME_ZONE:-ROC} /opt/etc/localtime

FROM gcr.io/distroless/base

COPY --from=0 /opt /

ENTRYPOINT [ "haproxy", "-W", "-db" ]
