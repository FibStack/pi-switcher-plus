
I2CLIB_DIR=../libfibstack
INC=-I$(I2CLIB_DIR)

fibstack: main.o i2clib.o libfibstack.o
	gcc -o fibstack main.o i2clib.o libfibstack.o
	gcc -shared -o libfibstack.so libfibstack.o i2clib.o

main.o: main.c $(I2CLIB_DIR)/i2clib.h $(I2CLIB_DIR)/fibstack.h
	gcc -Wall $(INC) -c -g main.c

i2clib.o: $(I2CLIB_DIR)/i2clib.c $(I2CLIB_DIR)/i2clib.h
	gcc -Wall $(INC) -c -g $(I2CLIB_DIR)/i2clib.c

libfibstack.o: $(I2CLIB_DIR)/libfibstack.c $(I2CLIB_DIR)/fibstack.h
	gcc -Wall $(INC) -c -g $(I2CLIB_DIR)/libfibstack.c

clean:
	rm fibstack *.o *.so
