DEPMOD  = /sbin/depmod
ARCH := $(ARCH)
KVER := $(shell uname -r)
KSRC := /lib/modules/$(KVER)/build

MODULE_NAME := lsm6ds3
lsm6ds3-core += lsm6ds3_core.o lsm6ds3_i2c.o
$(MODULE_NAME)-y += $(lsm6ds3-core)

obj-m := $(MODULE_NAME).o

SRC := $(shell pwd)

all:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)

modules_install:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install

clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions modules.order Module.symvers
