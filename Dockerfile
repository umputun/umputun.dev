FROM umputun/reproxy:latest

COPY . /srv/site
EXPOSE 8080

ENTRYPOINT ["/srv/reproxy", "--assets.location=/srv/site", "--assets.cache=30d", "--assets.cache=text/html:30s"]