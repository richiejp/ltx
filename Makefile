CC = gcc
CFLAGS = -g -Imsgpack

all:
	$(CC) $(CFLAGS) \
		msgpack/unpack.c \
		msgpack/message.c \
		ltx.c \
		-o ltx

debug:
	$(CC) $(CFLAGS) \
		-D DEBUG \
		msgpack/unpack.c \
		msgpack/message.c \
		ltx.c \
		-o ltx

test:
	$(CC) $(CFLAGS) -lcheck \
		msgpack/message.c \
		tests/test_utils.c \
		-o tests/test_utils

	$(CC) $(CFLAGS) -lcheck \
		msgpack/message.c \
		tests/test_message.c \
		-o tests/test_message

	$(CC) $(CFLAGS) -lcheck \
		msgpack/message.c \
		msgpack/unpack.c \
		tests/test_unpack.c \
		-o tests/test_unpack

clean:
	rm -f ltx tests/test_utils tests/test_message tests/test_unpack
