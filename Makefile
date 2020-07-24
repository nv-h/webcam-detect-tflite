CXXFLAGS ?= \
	-I$(HOME)/sources/tensorflow \
	-I$(HOME)/sources/tensorflow/tensorflow/lite/tools/make/downloads/flatbuffers/include \
	-I$(HOME)/sources/tensorflow/tensorflow/lite/tools/make/downloads/absl \
	-I/usr/include/freetype2/ \
	-I/usr/include/opencv4

LDFLAGS ?= \
	-L$(HOME)/sources/tensorflow/tensorflow/lite/tools/make/gen/linux_aarch64/lib/

.PHONY: all clean

all: webcam-detector

webcam-detector: main.o
	gcc -O3 -o webcam-detector main.o $(LDFLAGS) -ltensorflow-lite -lstdc++ -lpthread -ldl -lm -lopencv_videoio -lopencv_core -lopencv_highgui -lopencv_imgproc -lfreetype

main.o : main.cxx
	g++ -c --std=c++11 main.cxx -O3 $(CXXFLAGS)

clean:
	rm -f webcam-detector
