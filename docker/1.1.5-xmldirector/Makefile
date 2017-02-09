build:
	docker build --no-cache=false -t unixelias/plone.idg:1.1.5-x .

build-clean:
	docker build --no-cache=true -t unixelias/plone.idg:1.1.5-x .

run:
	docker run -p 12020:12020 unixelias/plone.idg:1.1.5-x

push:
	docker push unixelias/plone.idg:1.1.5-x
