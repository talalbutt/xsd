# file      : makefile
# author    : Boris Kolpackov <boris@codesynthesis.com>
# copyright : Copyright (c) 2005-2009 Code Synthesis Tools CC
# license   : GNU GPL v2 + exceptions; see accompanying LICENSE file

include $(dir $(lastword $(MAKEFILE_LIST)))build/bootstrap.make

default  := $(out_base)/
test     := $(out_base)/.test
install  := $(out_base)/.install
clean    := $(out_base)/.clean
cleandoc := $(out_base)/.cleandoc

.PHONY: $(default) $(test) $(install) $(clean)

$(default): $(out_base)/xsd/      \
            $(out_base)/tests/    \
            $(out_base)/examples/ \
            $(out_base)/documentation/

$(test): $(out_base)/tests/.test

$(install): $(out_base)/xsd/.install           \
            $(out_base)/libxsd/.install        \
            $(out_base)/documentation/.install
	$(call install-data,$(src_base)/FLOSSE,$(install_doc_dir)/xsd/FLOSSE)
	$(call install-data,$(src_base)/GPLv2,$(install_doc_dir)/xsd/GPLv2)
	$(call install-data,$(src_base)/LICENSE,$(install_doc_dir)/xsd/LICENSE)
	$(call install-data,$(src_base)/NEWS,$(install_doc_dir)/xsd/NEWS)
	$(call install-data,$(src_base)/README,$(install_doc_dir)/xsd/README)


$(clean): $(out_base)/xsd/.clean      \
          $(out_base)/tests/.clean    \
          $(out_base)/examples/.clean

$(cleandoc): $(out_base)/documentation/.cleandoc

$(call include,$(bld_root)/install.make)

$(call import,$(src_base)/xsd/makefile)
$(call import,$(src_base)/libxsd/makefile)
$(call import,$(src_base)/tests/makefile)
$(call import,$(src_base)/examples/makefile)
$(call import,$(src_base)/documentation/makefile)
