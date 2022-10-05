files = metadata.rb \
	Policyfile.rb \
	recipes/chef.rb \
	recipes/consul.rb \
	recipes/default.rb \
	recipes/firewall.rb \
	recipes/nolo.rb \
	recipes/tools.rb \
	recipes/user.rb


Policyfile.lock.json: ${files}
	rm -f Policyfile.lock.json
	chef install

push:
	chef push production Policyfile.rb -c ~/config/knife_config.rb
