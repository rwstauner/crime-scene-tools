maat_dir = ixmaat0.8.5
maat_zip = $(maat_dir).zip
maat_url = https://s3.amazonaws.com/CodeMaatDistro/$(maat_zip)

script_dir = scripts
script_zip = scripts0.4.zip
script_url = https://s3.amazonaws.com/CodeMaatDistro/$(script_zip)

all: $(maat_dir) $(script_dir)

$(maat_zip):
	wget -O $(maat_zip) $(maat_url)

$(maat_dir): $(maat_zip)
	unzip $(maat_zip)

$(script_zip):
	wget -O $(script_zip) $(script_url)

$(script_dir): $(script_zip)
	mkdir -p $(script_dir)
	(cd $(script_dir) && unzip -j ../scripts0.4.zip 'scripts*/*.py')

# TODO: tree map
#https://github.com/adamtornhill/MetricsTreeMap/archive/master.zip

test:
	./entrypoint maat --help
	./entrypoint complexity_analysis -h
	echo | ./entrypoint cloc -
