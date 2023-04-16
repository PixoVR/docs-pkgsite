
#FROM	docs-docker-base
FROM	gcr.io/pixo-bootstrap/docs-docker-base:latest

ARG	CACHEBREAKER=https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h

WORKDIR	/build

COPY	. .

#ADD	$CACHEBREAKER skipcache

# already set, but ok to set again
#ENV	GOPATH=/tmp/go
ENV     GOCACHE=/tmp/gocache
ENV	GOENV=/tmp/.config/go/env
ENV	GOTMPDIR=/tmp/gotmpdir
ENV	GOPROXY=https://proxy.golang.org,direct
#ENV	GOPROXY=file://$(go env GOMODCACHE)/cache/download

# can't do this here, because /tmp doesn't exist yet
#RUN	mkdir -pv $GOPATH $GOCACHE $GOENV $GOTMPDIR

ENV	PATH=$GOPATH/bin:$PATH

# specifics for serving docs to nginx proxy.
ENV	PKGSITE_SOURCE=/build/
ENV	PKGSITE_PORT=3001
ENV	PKGSITE_HOST=localhost

# this sets PROJECT_URL, among other things.
# (we grep out bad lines here as well for env2.sh)
RUN	cat ./documentation/env.sh | grep -v git > /env2.sh

RUN	. /env2.sh && \
	/documentation/docs-pkgsite/setup_nginx.sh

# move the documentation away, so the documentation doesn't document itself
RUN	mv /build/documentation /documentation/documentation

# run for a moment to let the cache populate
RUN	timeout 120 /documentation/docs-pkgsite/start_services.sh \
	|| true

# We want to proxy from nginx, so we have to start both services, which is the job of start_services.sh
CMD	"/documentation/docs-pkgsite/start_services.sh"



