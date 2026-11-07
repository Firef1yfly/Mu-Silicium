##
#  Copyright (c) 2011 - 2022, ARM Limited. All rights reserved.
#  Copyright (c) 2014, Linaro Limited. All rights reserved.
#  Copyright (c) 2015 - 2020, Intel Corporation. All rights reserved.
#  Copyright (c) 2018, Bingxing Wang. All rights reserved.
#  Copyright (c) Microsoft Corporation.
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
##

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################
[Defines]
  PLATFORM_NAME                  = onyx
  PLATFORM_GUID                  = 41AD30D5-DD2C-47BB-8508-0E9BA1CB8E1D
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/onyxPkg
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = RELEASE|DEBUG
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = onyxPkg/onyx.fdf
  USE_CUSTOM_DISPLAY_DRIVER      = 0

!include BonitoPkg/BonitoPkg.dsc.inc

[PcdsFixedAtBuild]
  #
  # DDR Memory
  #
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000

  #
  # UEFI Stack
  #
  gArmPlatformTokenSpaceGuid.PcdCPUCoresStackBase|0xA760D000
  gArmPlatformTokenSpaceGuid.PcdCPUCorePrimaryStackSize|0x40000

  #
  # UniXNU boot manager
  #
  gUniXNUPkgTokenSpaceGuid.PcdUniXNUDebugLevel|0x00000040
  gUniXNUPkgTokenSpaceGuid.PcdUniXNUConfigPath|L"\\EFI\\UniXNU\\unixnu.toml"

  #
  # SMBIOS
  #
  gSiliciumPkgTokenSpaceGuid.PcdSmbiosSystemManufacturer|"Xiaomi"
  gSiliciumPkgTokenSpaceGuid.PcdSmbiosSystemModel|"Poco F7"
  gSiliciumPkgTokenSpaceGuid.PcdSmbiosSystemRetailModel|"onyx"
  gSiliciumPkgTokenSpaceGuid.PcdSmbiosSystemRetailSku|"Poco_F7_onyx"
  gSiliciumPkgTokenSpaceGuid.PcdSmbiosSystemBoardModel|"Poco F7"

  #
  # Simple Frame Buffer
  #
  gSiliciumPkgTokenSpaceGuid.PcdFrameBufferWidth|1280
  gSiliciumPkgTokenSpaceGuid.PcdFrameBufferHeight|2772
  gSiliciumPkgTokenSpaceGuid.PcdFrameBufferColorDepth|32

  #
  # Platform PEI
  #
  gQcomPkgTokenSpaceGuid.PcdPlatformType|"LA"

[LibraryClasses]
  #
  # Memory Libraries
  #
  MemoryMapLib|onyxPkg/Library/MemoryMapLib/MemoryMapLib.inf

  #
  # QCOM Libraries
  #
  ConfigurationMapLib|onyxPkg/Library/ConfigurationMapLib/ConfigurationMapLib.inf

  #
  # UniXNU boot manager
  #
  UniXNULib|UniXNUPkg/Library/UniXNULib/UniXNULib.inf

[Components]
  #
  # ACPI Tables
  #
  #onyx/AcpiTables.inf

  #
  # UniXNU boot manager stack
  #
  UniXNUPkg/Driver/UniXNURamDiskDxe/UniXNURamDiskDxe.inf
  UniXNUPkg/Driver/UniXNUDxe/UniXNUDxe.inf
  UniXNUPkg/Application/UniXNU/UniXNU.inf
  DarwinBootPkg/Driver/DarwinBoot.inf
  MdeModulePkg/Universal/Disk/DiskIoDxe/DiskIoDxe.inf
  MdeModulePkg/Universal/Disk/PartitionDxe/PartitionDxe.inf
  MdeModulePkg/Universal/Disk/UnicodeCollation/EnglishDxe/EnglishDxe.inf
  FatPkg/EnhancedFatDxe/Fat.inf

[BuildOptions]
  CLANGPDB:*_*_*_DLINK_FLAGS = /FILEALIGN:0x200
