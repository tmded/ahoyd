TARGET := iphone:clang:latest:13.0

include $(THEOS)/makefiles/common.mk

TOOL_NAME = Ahoyd

Ahoyd_FILES = main.swift Broadcast.swift 
Ahoyd_CODESIGN_FLAGS = -Sentitlements.plist
Ahoyd_INSTALL_PATH = /usr/local/bin

include $(THEOS_MAKE_PATH)/tool.mk
