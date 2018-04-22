CONTAINER_NAME=rustify
MOUNT_SRC=$(shell pwd)
MOUNT_DEST=/srv/$(CONTAINER_NAME)

all:
	@echo "targets:"
	@echo "	make build-docker"
	@echo "	make run-docker"

build-docker:
	docker build -t $(CONTAINER_NAME) .

run-docker:
	$(eval container_id=$(shell docker container ls -a | grep $(CONTAINER_NAME) | cut -d ' ' -f 1))
	if [ -z "$(container_id)" ]; then                                                                            \
		docker run -it --mount type=bind,source=$(MOUNT_SRC),target=$(MOUNT_DEST) $(CONTAINER_NAME) || true;       \
	else                                                                                                         \
		docker start -ai $(container_id) || true;                                                                  \
	fi
