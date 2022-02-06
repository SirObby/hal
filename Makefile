CC=/usr/bin/gcc
CFLAGS=-g -Wall -std=c99
LDFLAGS=-lvosk

O=obj
OBJS=	${O}/main.o

all: hal

hal: $(OBJS)
	$(CC) ${CFLAGS} $(LDFLAGS) $(OBJS) -o hal

install_vosk:
	git clone https://github.com/alphacep/vosk-api.git
	cp ./vosk-api/src/*.h /usr/local/include/
	pip3 install vosk
	wget https://alphacephei.com/vosk/models/vosk-model-en-us-0.22.zip
	unzip vosk-model-en-us-0.22.zip
	mv vosk-model-en-us-0.22 model

$(O)/%.o:	%.c
	$(CC) $(CFLAGS) -c $< -o $@