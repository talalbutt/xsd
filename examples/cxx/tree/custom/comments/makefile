# file      : examples/cxx/tree/custom/comments/makefile
# copyright : Copyright (c) 2005-2014 Code Synthesis Tools CC
# license   : GNU GPL v2 + exceptions; see accompanying LICENSE file

include $(dir $(lastword $(MAKEFILE_LIST)))../../../../../build/bootstrap.make

xsd := people.xsd
cxx := driver.cxx xml-schema-custom.cxx dom-parse.cxx

obj := $(addprefix $(out_base)/,$(cxx:.cxx=.o) $(xsd:.xsd=.o))
dep := $(obj:.o=.o.d)

driver   := $(out_base)/driver
install  := $(out_base)/.install
dist     := $(out_base)/.dist
dist-win := $(out_base)/.dist-win
clean    := $(out_base)/.clean


# Import.
#
$(call import,\
  $(scf_root)/import/libxerces-c/stub.make,\
  l: xerces_c.l,cpp-options: xerces_c.l.cpp-options)

# Build.
#
$(driver): $(obj) $(xerces_c.l)

$(obj) $(dep): cpp_options := -I$(out_base) -I$(src_base) -I$(src_root)/libxsd
$(obj) $(dep): $(xerces_c.l.cpp-options)

# Header file for XML Schema namespace.
#
$(out_base)/xml-schema.hxx: $(out_root)/xsd/xsd
	$(call message,xsd $(src_base)/xml-schema.xsd,\
$(out_root)/xsd/xsd cxx-tree --output-dir $(out_base) --generate-xml-schema \
--generate-serialization --custom-type anyType=/type_base \
--hxx-epilogue '#include "xml-schema-custom.hxx"' xml-schema.xsd)

#
#
genf := $(xsd:.xsd=.hxx) $(xsd:.xsd=.ixx) $(xsd:.xsd=.cxx)
gen  := $(addprefix $(out_base)/,$(genf))

$(gen): xsd := $(out_root)/xsd/xsd
$(gen): xsd_options += \
--generate-inline \
--generate-serialization \
--extern-xml-schema xml-schema.xsd

$(gen): $(out_root)/xsd/xsd

$(call include-dep,$(dep),$(obj),$(gen))

# Convenience alias for default target.
#
$(out_base)/: $(driver)


# Install & Dist.
#
dist-common := $(out_base)/.dist-common

$(install) $(dist) $(dist-win) $(dist-common): path := $(subst $(src_root)/,,$(src_base))

$(install):
	$(call install-data,$(src_base)/README,$(install_doc_dir)/xsd/$(path)/README)
	$(call install-data,$(src_base)/driver.cxx,$(install_doc_dir)/xsd/$(path)/driver.cxx)
	$(call install-data,$(src_base)/people.xsd,$(install_doc_dir)/xsd/$(path)/people.xsd)
	$(call install-data,$(src_base)/people.xml,$(install_doc_dir)/xsd/$(path)/people.xml)
	$(call install-data,$(src_base)/xml-schema-custom.hxx,$(install_doc_dir)/xsd/$(path)/xml-schema-custom.hxx)
	$(call install-data,$(src_base)/xml-schema-custom.cxx,$(install_doc_dir)/xsd/$(path)/xml-schema-custom.cxx)
	$(call install-data,$(src_base)/dom-parse.hxx,$(install_doc_dir)/xsd/$(path)/dom-parse.hxx)
	$(call install-data,$(src_base)/dom-parse.cxx,$(install_doc_dir)/xsd/$(path)/dom-parse.cxx)

$(dist-common):
	$(call install-data,$(src_base)/driver.cxx,$(dist_prefix)/$(path)/driver.cxx)
	$(call install-data,$(src_base)/people.xsd,$(dist_prefix)/$(path)/people.xsd)
	$(call install-data,$(src_base)/people.xml,$(dist_prefix)/$(path)/people.xml)
	$(call install-data,$(src_base)/xml-schema-custom.hxx,$(dist_prefix)/$(path)/xml-schema-custom.hxx)
	$(call install-data,$(src_base)/xml-schema-custom.cxx,$(dist_prefix)/$(path)/xml-schema-custom.cxx)
	$(call install-data,$(src_base)/dom-parse.hxx,$(dist_prefix)/$(path)/dom-parse.hxx)
	$(call install-data,$(src_base)/dom-parse.cxx,$(dist_prefix)/$(path)/dom-parse.cxx)

$(dist): $(dist-common)
	$(call install-data,$(src_base)/README,$(dist_prefix)/$(path)/README)

$(dist-win): $(dist-common)
	$(call install-data,$(src_base)/README,$(dist_prefix)/$(path)/README.txt)
	$(call message,,todos $(dist_prefix)/$(path)/README.txt)

# Clean.
#
$(clean): $(driver).o.clean                            \
  $(addsuffix .cxx.clean,$(obj))                       \
  $(addsuffix .cxx.clean,$(dep))                       \
  $(addprefix $(out_base)/,$(xsd:.xsd=.cxx.xsd.clean))
	$(call message,rm $$1,rm -f $$1,$(out_base)/xml-schema.hxx)

# Generated .gitignore.
#
ifeq ($(out_base),$(src_base))
$(gen): | $(out_base)/.gitignore
$(driver): | $(out_base)/.gitignore

$(out_base)/.gitignore: files := driver xml-schema.hxx $(genf)
$(clean): $(out_base)/.gitignore.clean

$(call include,$(bld_root)/git/gitignore.make)
endif

# How to.
#
$(call include,$(bld_root)/cxx/o-e.make)
$(call include,$(bld_root)/cxx/cxx-o.make)
$(call include,$(bld_root)/cxx/cxx-d.make)
$(call include,$(bld_root)/install.make)
$(call include,$(scf_root)/xsd/tree/xsd-cxx.make)

# Dependencies.
#
$(call import,$(src_root)/xsd/makefile)
