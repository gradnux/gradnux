# bootc stuff, i guess.
FROM scratch

COPY rootfs/* /

CMD ["/sbin/init"]