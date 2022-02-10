.PHONY: install validate execute generate classify parse
.SILENT: install validate execute generate classify parse

install:
	brew install ruby
	brew install swi-prolog
	bundle install

validate:
	cd mission-executive/operations/; \
		find . -name 'operation_*' -exec kwalify -lf schema.yaml {} \;

execute:
	cd mission-executive/; ./mission.rb

generate:
	cd mission-executive/; \
		./asset_template.rb; \
		./survivability_template.rb; \
		./property_template.rb

classify:
	cd prolog-kb/; swipl

parse:
	cd parser/; ./parser.rb
