# This bazel build file should work **if** you have compiled tensorflow with AOT compilation, and have configured bazel to cross-compile for RPi
# You could also just call the ./build.sh file

load("//third_party/tensorflow/compiler/aot:tfcompile.bzl", "tf_library")

tf_library(
  name="pi_imagenet_example",
  graph="imgnet.pb",
  config="imgnet_config.pbtxt",
  cpp_class="PiExamples::ImgNet",
)
