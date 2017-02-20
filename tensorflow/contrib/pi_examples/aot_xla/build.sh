# Uses Tensorflow XLA to build an Ahead-Of-Time binary for ImageNet for Raspberry Pi
# Usage:
# ./build.sh <RaspberryPi Model Number> <ImgNet Graph Location>

if [ "$2" == "" ]
then
  curl https://storage.googleapis.com/download.tensorflow.org/models/inception5h.zip --output inception.zip
  unzip inception.zip inception
  mv inception/tensorflow_inception_graph.pb ./imgnet.pb
else
  mv $2 ./imgnet.pb
fi

function build3 () {
  tfcompile --graph=imgnet.pb --config=imgnet_config.pbtxt --target_triple=arm-v8-unknown-linux-gnueabi --target_cpu=cortex-a53 --target_features=neon-fp-armv8
}

case "$1" in
    0) echo "RPi Zero not yet supported";;
    1) echo "Coming Soon";;
    2) echo "Coming Soon";;
    3) build3;;
    *) echo "Unknown model";;
esac
