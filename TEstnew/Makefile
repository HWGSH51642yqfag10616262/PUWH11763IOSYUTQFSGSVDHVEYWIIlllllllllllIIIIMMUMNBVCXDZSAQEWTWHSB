export THEOS=/var/mobile/theos
ARCHS = arm64 
DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1
GO_EASY_ON_ME = 1



include $(THEOS)/makefiles/common.mk

TWEAK_NAME = hdj
hdj_FRAMEWORKS = UIKit Foundation Security QuartzCore CoreGraphics CoreText IOKit
hdj_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG
hdj_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value
hdj_FILES = $(wildcard Menu/*.m) $(wildcard Menu/*.mm) 
Virus_LIBRARIES += substrate
include $(THEOS_MAKE_PATH)/tweak.mk