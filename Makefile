JEKYLL_VERSION=3.8

build:
	docker run --rm --volume="${PWD}:/srv/jekyll" \
	--volume="${PWD}/vendor/bundle:/usr/local/bundle" \
	-it jekyll/jekyll:${JEKYLL_VERSION} \
	jekyll build

serve:
	docker run --rm --volume="${PWD}:/srv/jekyll" \
	--volume="${PWD}/vendor/bundle:/usr/local/bundle" \
	-p 4000:4000/tcp \
	-it jekyll/jekyll:${JEKYLL_VERSION} \
	jekyll serve

clean:
	-rm -fr *~
