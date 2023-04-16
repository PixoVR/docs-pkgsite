
#FROM	docs-docker-base
FROM	gcr.io/pixo-bootstrap/docs-docker-base:latest

ARG	CACHEBREAKER=https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h

WORKDIR	/build

COPY	. .

#ADD	$CACHEBREAKER skipcache

# this sets PROJECT_URL, among other things.
# (we grep out bad lines here as well for env2.sh)
RUN	cat ./documentation/env.sh | grep -v git > ./documentation/env2.sh

#ENV     GOCACHE=/tmp/gocache
#ENV     GOPROXY=https://proxy.golang.org

ENV	PKGSITE_SOURCE=/build/
ENV	PKGSITE_PORT=3001
ENV	PKGSITE_HOST=localhost

RUN	. ./documentation/env2.sh && \
	/documentation/docs-pkgsite/setup_nginx.sh

# move the documentation away, so the documentation doesn't document itself
RUN	mv /build/documentation /documentation/documentation

# We want to proxy from nginx, so we have to start both services, which is the job of start_services.sh
CMD	"/documentation/docs-pkgsite/start_services.sh" "${PKGSITE_SOURCE}" "${PKGSITE_PORT}" "${PKGSITE_HOST}"


