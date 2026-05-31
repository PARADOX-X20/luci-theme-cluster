#
# Copyright 2025-2026 paradox-x20
#
# Licensed under the Apache License, Version 2.0.
# See LICENSE and NOTICE for details.
#
# Simplified Makefile for APK/IPK compatibility
# Thanks to @smalleaves for the suggestion (GitHub issue #8)
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-theme-cluster
cluster_VERSION?=1.2.0
cluster_RELEASE?=1

PKG_VERSION:=$(cluster_VERSION)
PKG_RELEASE:=$(cluster_RELEASE)

LUCI_TITLE:=Cluster - Elegant Dark Theme for LuCI
LUCI_DEPENDS:=+luci-base
LUCI_PKGARCH:=all

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE NOTICE

include $(TOPDIR)/feeds/luci/luci.mk

define Package/$(PKG_NAME)/postinst
#!/bin/sh
[ -n "$$IPKG_INSTROOT" ] || {
	[ -f /etc/uci-defaults/30_luci-theme-cluster ] && sh /etc/uci-defaults/30_luci-theme-cluster >/dev/null 2>&1 || true
	/etc/init.d/rpcd restart >/dev/null 2>&1 || true
	rm -f /tmp/cluster-search-prefetch-cache.json /tmp/cluster-search-prefetch-cache-meta.json >/dev/null 2>&1 || true
	rm -rf /tmp/cluster-search-cache /tmp/cluster-search-cache-meta >/dev/null 2>&1 || true
	rm -rf /tmp/luci-indexcache* /tmp/luci-modulecache >/dev/null 2>&1 || true
	/etc/init.d/uhttpd reload >/dev/null 2>&1 || /etc/init.d/uhttpd restart >/dev/null 2>&1 || true
}

exit 0
endef

define Package/$(PKG_NAME)/postrm
#!/bin/sh
[ -n "$$IPKG_INSTROOT" ] || {
	/etc/init.d/rpcd restart >/dev/null 2>&1 || true
	rm -f /tmp/cluster-search-prefetch-cache.json /tmp/cluster-search-prefetch-cache-meta.json >/dev/null 2>&1 || true
	rm -rf /tmp/cluster-search-cache /tmp/cluster-search-cache-meta >/dev/null 2>&1 || true
	rm -rf /tmp/luci-indexcache* /tmp/luci-modulecache >/dev/null 2>&1 || true
	/etc/init.d/uhttpd reload >/dev/null 2>&1 || /etc/init.d/uhttpd restart >/dev/null 2>&1 || true
}

exit 0
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
