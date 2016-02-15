FROM alpine
RUN    apk update                                                          \
    && apk upgrade                                                         \
    && apk add squid                                                       \
    && echo '#!/bin/sh'                                  >> /entrypoint.sh \
    && echo '# start squid'                              >> /entrypoint.sh \
    && echo 'if ! pgrep squid'                           >> /entrypoint.sh \
    && echo 'then'                                       >> /entrypoint.sh \
    && echo '  squid'                                    >> /entrypoint.sh \
    && echo 'fi'                                         >> /entrypoint.sh \
    && echo '# wait for log file'                        >> /entrypoint.sh \
    && echo 'while ! [ -f "/var/log/squid/access.log" ]' >> /entrypoint.sh \
    && echo 'do'                                         >> /entrypoint.sh \
    && echo '  sleep 1'                                  >> /entrypoint.sh \
    && echo 'done'                                       >> /entrypoint.sh \
    && echo '# tail log file'                            >> /entrypoint.sh \
    && echo 'tail -f /var/log/squid/access.log'          >> /entrypoint.sh \
    && chmod +x /entrypoint.sh
EXPOSE 3128
ENTRYPOINT ["/entrypoint.sh"]
