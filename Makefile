files = \
	attributes/consul.rb \
	attributes/default.rb \
	metadata.rb \
	Policyfile.rb \
	recipes/blank_slate.rb \
	recipes/chef.rb \
	recipes/consul.rb \
	recipes/default.rb \
	recipes/taliafoco.rb \
	recipes/mosh.rb \
	recipes/nolo.rb \
	recipes/sudo.rb \
	recipes/usatores.rb \
	recipes/utensiles.rb \
	templates/authorized_keys.erb 

Policyfile.lock.json: ${files}
	rm -f Policyfile.lock.json
	./bin/chef-cli install

.DEFAULT: all
all: Policyfile.lock.json

push: Policyfile.lock.json
	./bin/chef-cli push production Policyfile.lock.json
