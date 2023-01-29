[ -f ./tmp/payload.bin ] && echo "payload.bin exists, proceed to the next step" && rm -rf ./payloaddumper && git clone https://github.com/vm03/payload_dumper.git ./payloaddumper && pip install protobuf==3.19.3 six==1.16.0 bsdiff4==1.1.5 && python payloaddumper/payload_dumper.py tmp/payload.bin && cd output && for img in *.img; do zip payload.zip $img;done && exit 1
[ ! -f ./tmp/payload.bin ] && echo "payload.bin does not exist, Checking for system.img exists"
[ -f ./tmp/system.img ] && echo "system.img exists, proceed to the next step" && for img in ./tmp/*.img; do zip payload.zip $img;done && exit 1
[ ! -f ./tmp/system.img ] && echo "system.img does not exist,Failed" && exit 1
