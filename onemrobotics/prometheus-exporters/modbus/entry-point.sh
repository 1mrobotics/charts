apk update && apk add git && mkdir modbus

git clone "https://github.com/RichiH/modbus_exporter.git" /modbus && cd /modbus

go build && ./modbus_exporter -config.file /home/modbus.yml