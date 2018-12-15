.PHONY: all clean up down

PROJNAME := ea-review

all: images/ui.tar images/api.tar

images/%.tar: docker/%
	mkdir -p images
	docker build --tag  $(PROJNAME)-$(basename $(notdir $@)) \
               --file docker/$(basename $(notdir $@))/Dockerfile .
	docker save --output $@ $(PROJNAME)-$(basename $(notdir $@))

clean:
	rm -rf images

up: all
	docker-compose --project-name $(PROJNAME) \
                 --file docker/docker-compose.yml up --detach

down:
	docker-compose --project-name $(PROJNAME) \
                 --file docker/docker-compose.yml down

down: