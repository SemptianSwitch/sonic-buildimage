# libsaithrift-dev package

SAI_VER = 0.9.4

LIBSAITHRIFT_DEV = libsaithrift-dev_$(SAI_VER)_$(CONFIGURED_ARCH).deb
$(LIBSAITHRIFT_DEV)_SRC_PATH = $(SRC_PATH)/sonic-sairedis/SAI
$(LIBSAITHRIFT_DEV)_DEPENDS += $(LIBTHRIFT) $(LIBTHRIFT_DEV) $(PYTHON_THRIFT) $(THRIFT_COMPILER) $(CENTEC_SAI) $(LIBHIREDIS) $(LIBNL3_DEV) $(LIBNL_GENL3_DEV)
$(LIBSAITHRIFT_DEV)_RDEPENDS += $(LIBTHRIFT) $(CENTEC_SAI)
SONIC_DPKG_DEBS += $(LIBSAITHRIFT_DEV)

PYTHON_SAITHRIFT = python-saithrift_$(SAI_VER)_$(CONFIGURED_ARCH).deb
$(eval $(call add_extra_package,$(LIBSAITHRIFT_DEV),$(PYTHON_SAITHRIFT)))

SAISERVER = saiserver_$(SAI_VER)_$(CONFIGURED_ARCH).deb
$(SAISERVER)_RDEPENDS += $(LIBTHRIFT) $(CENTEC_SAI) $(LIBHIREDIS) $(LIBNL3_DEV) $(LIBNL_GENL3_DEV)
$(eval $(call add_extra_package,$(LIBSAITHRIFT_DEV),$(SAISERVER)))

SAISERVER_DBG = saiserver-dbg_$(SAI_VER)_$(CONFIGURED_ARCH).deb
$(SAISERVER_DBG)_RDEPENDS += $(SAISERVER)
$(eval $(call add_extra_package,$(LIBSAITHRIFT_DEV),$(SAISERVER_DBG)))
