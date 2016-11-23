build:
	docker build -t container-transform .

test: build test-compose-to-ecs test-ecs-to-compose test-compose-to-systemd test-ecs-to-systemd

test-compose-to-ecs:
	docker run --rm -w /container-transform -i container-transform \
		container_transform/tests/docker-compose.yml -v

test-ecs-to-compose:
	docker run --rm -w /container-transform -i container-transform \
		container_transform/tests/task.json --input-type ecs --output-type compose

test-compose-to-systemd:
	docker run --rm -w /container-transform -i container-transform \
		container_transform/tests/docker-compose.yml -v --output-type systemd

test-ecs-to-systemd:
	docker run --rm -w /container-transform -i container-transform \
		container_transform/tests/task.json --input-type ecs --output-type systemd
