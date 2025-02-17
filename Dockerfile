FROM rkrahl/opensuse:15.6

RUN zypper --non-interactive refresh

RUN zypper --non-interactive install \
	postfix

COPY start-postfix.sh /etc/postfix
RUN chmod 0755 /etc/postfix/start-postfix.sh

CMD ["/etc/postfix/start-postfix.sh"]

EXPOSE 25
