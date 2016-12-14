maat_dir = ixmaat0.8.5
maat_zip = $(maat_dir).zip
maat_url = https://s3.amazonaws.com/CodeMaatDistro/$(maat_zip)

script_dir = scripts
script_zip = scripts0.4.zip
script_url = https://s3.amazonaws.com/CodeMaatDistro/$(script_zip)

all: $(maat_dir) $(script_dir) wrappers

$(maat_zip):
	wget -O $(maat_zip) $(maat_url)

$(maat_dir): $(maat_zip)
	unzip $(maat_zip)

$(script_zip):
	wget -O $(script_zip) $(script_url)

$(script_dir): $(script_zip)
	mkdir -p $(script_dir)
	(cd $(script_dir) && unzip -j ../scripts0.4.zip 'scripts*/*.py')

.PHONY: wrappers
wrappers:
	mkdir -p bin; \
	wrapper () { \
		{ \
			echo '#!/bin/sh'; \
			echo '# generated from Makefile'; \
			cat; \
		} > bin/$$1; chmod 0755 bin/$$1; \
	}; \
	grep -l -E 'argv|argparse' scripts/*.py | sed -r 's,^.+/([^/]+)\.py$$,\1,' | while read script; do \
		echo 'exec python `dirname "$$0"`/../$(script_dir)/'"$$script"'.py "$$@"' \
			| wrapper $$script; \
	done; \
	echo 'exec `dirname "$$0"`/../ixmaat*/maat "$$@"' | wrapper maat

# TODO: tree map
#https://github.com/adamtornhill/MetricsTreeMap/archive/master.zip

.PHONY: test
test:
	bin/maat --help
	bin/complexity_analysis -h
	PATH=`pwd`/bin:$$PATH git maat-log -n 1
