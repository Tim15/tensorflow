# Uses Tensorflow XLA to build an Ahead-Of-Time binary for ImageNet for Raspberry Pi
# Usage:
# ./build.sh <RaspberryPi Model Number>

function build3 () {
  tfcompile --graph=imgnet.pb --config=imgnet_config.pbtxt --target_triple=arm-v8-unknown-linux-gnueabi --target_cpu=cortex-a53 --target_features=neon-fp-armv8
}

case "$1" in
    0) echo "RPi Zero not yet supported";;
    1) echo "Coming Soon";;
    2) echo "Coming Soon";;
    3) build3
    *) echo "Unknown model";;
esac
