# glpi-agent-docker

Docker Image of glpi-agent

## Build

```
docker build -t glpi-agent .
```

## Usage

* Learn perl version: ```docker run -it glpi-agent```

* List glpi-agent executables: ```docker run -it --entrypoint=/bin/bash glpi-agent -c "ls -hal /usr/local/bin/glpi*"````

* Learn glpi-agent version: ```docker run -it glpi-agent glpi-agent --version```

* Manual inventory discovery: ```docker run -it glpi-agent glpi-inventory --json > inventory.json```

* Manual inventory injection to GLPI server: ```docker run -it glpi-agent glpi-injector -f inventory.json -u http://localhost```

* Disable SSL check if server is self-signed: ```docker run -it glpi-agent glpi-injector -f inventory.json -u https://localhost --debug --no-ssl-check```

* Network discovery and injection

```
# make sure there is a net directory
docker run -it glpi-agent glpi-netdiscovery --first 192.168.1.20 --last 192.168.1.255 --v1 -s net --debug --timeout 10

docker run -it glpi-agent glpi-injector -d net/netdiscovery/ -u http://localhost
```
