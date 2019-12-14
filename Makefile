all: target/main.js target/index.html target/main.css target/images target/logs

.PHONY: clean start stop

clean: stop
	rm -rf target

target/main.js: src/main/elm/main.elm
	mkdir -p target
	elm make src/main/elm/main.elm --output $@

target/index.html: src/main/html/index.html
	mkdir -p target
	cp src/main/html/index.html target

target/main.css: src/main/css/main.css
	mkdir -p target
	cp src/main/css/main.css target

target/images: src/main/images
	mkdir -p target
	cp -R src/main/images

target/logs:
	mkdir -p $@

start:
	(cd target && python3 -m http.server 8010 & echo -n $$! > target/server.pid)

stop:
	kill `cat target/server.pid`
