
FROM	docs-docker-base as builder

WORKDIR	/build

COPY	. .

#RUN	pkgsite --version	#doesn't produce a version, but confirms installation

RUN	git submodule set-branch --branch main documentation/docs-pkgsite && \
	git submodule update --init documentation/docs-pkgsite

# move the documentation away, so the documentation doesn't document itself
RUN	mv /build/documentation /documentation/documentation

#ENTRYPOINT ["/docker-entrypoint.sh"]
# a third parameter here is the host, but the empty string allows for all hosts (instead of just localhost)
#CMD	["/build/documentation/docs-pkgsite/start_pkgsite.sh", "/build/", "3000",""]
CMD	["/documentation/documentation/docs-pkgsite/start_pkgsite.sh", "/build/", "3000",""]
