.build:
	docker build -t ssh_server ./
.run:
	docker run -d -P --name ssh_server  -e OWNER_PASSWORD=123 ssh_server
.delete:
	docker rm -f ssh_server
.logs:
	docker logs ssh_server
.port:
	docker port ssh_server 22
.connect:
	ssh owner@127.0.0.1 -p32786