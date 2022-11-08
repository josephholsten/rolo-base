files = metadata.rb \
	Policyfile.rb \
	recipes/chef.rb \
	recipes/consul.rb \
	recipes/default.rb \
	recipes/firewall.rb \
	recipes/nolo.rb \
	recipes/utensiles.rb \
	recipes/utilizadores.rb

Policyfile.lock.json: ${files}
	rm -f Policyfile.lock.json
	chef install

.DEFAULT: all
all: Policyfile.lock.json

push: Policyfile.lock.json
	chef push production Policyfile.lock.json
