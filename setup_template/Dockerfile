
#FROM	docs-docker-base
FROM	gcr.io/pixo-bootstrap/docs-docker-base:latest

ARG	CACHEBREAKER=https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h

WORKDIR	/build

COPY	. .

# specifics for serving docs to nginx proxy.
ENV	PKGSITE_SOURCE=/build/
ENV	PKGSITE_PORT=3001
ENV	PKGSITE_HOST=localhost

# this sets PROJECT_URL, among other things.
# (we grep out bad lines here as well for env2.sh)
RUN	cat ./documentation/env.sh | grep -v git > /env2.sh

RUN	. /env2.sh \
	&& /base/docs-pkgsite/setup_nginx.sh

# move the documentation away, so the documentation doesn't document itself
RUN	mv /build/documentation /base/documentation

# run for a moment to let the cache populate
#RUN	timeout 180 /base/docs-pkgsite/start_services.sh \
#	|| true

#ENV	GOGC=10
#ENV	GOMEMLIMIT=3000MiB

#ENV	DEBUG=true

# We want to proxy from nginx, so we have to start both services, which is the job of start_services.sh
CMD	"/base/docs-pkgsite/start_services.sh"

