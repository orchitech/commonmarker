C_SOURCES = $(wildcard ext/commonmarker_fixed_sourcepos/*.[ch])

update-c-sources: build-upstream $(C_SOURCES)

.PHONY: build-upstream

build-upstream:
	cd ext/commonmarker_fixed_sourcepos/cmark-upstream && make

ext/commonmarker_fixed_sourcepos/%: ext/commonmarker_fixed_sourcepos/cmark-upstream/src/%
	cp $< $@

ext/commonmarker_fixed_sourcepos/%: ext/commonmarker_fixed_sourcepos/cmark-upstream/extensions/%
	cp $< $@

ext/commonmarker_fixed_sourcepos/config.h: ext/commonmarker_fixed_sourcepos/cmark-upstream/build/src/config.h
	cp $< $@

ext/commonmarker_fixed_sourcepos/cmark-gfm_export.h: ext/commonmarker_fixed_sourcepos/cmark-upstream/build/src/cmark-gfm_export.h
	cp $< $@

ext/commonmarker_fixed_sourcepos/cmark-gfm_version.h: ext/commonmarker_fixed_sourcepos/cmark-upstream/build/src/cmark-gfm_version.h
	cp $< $@

ext/commonmarker_fixed_sourcepos/cmark-gfm-extensions_export.h: ext/commonmarker_fixed_sourcepos/cmark-upstream/build/extensions/cmark-gfm-extensions_export.h
	cp $< $@
