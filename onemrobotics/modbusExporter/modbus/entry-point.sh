apk update && apk add git && apk add go

MODBUS_YML=../modbus.yml

git clone "https://github.com/RichiH/modbus_exporter.git"

cd modbus_exporter

go build

./modbus_exporter -config.file ${MODBUS_YML}
