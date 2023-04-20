default["base"]["chef_server_url"] = "https://api.chef.io/organizations/josephholsten"
default["base"]["chef_infra_version"] = "17"

default["fail2ban"]["logtarget"] = 'SYSLOG'

default["yum"]["epel"]["enabled"] = true

default['rsyslog']['config_files']['group'] = node['root_group']
default['rsyslog']['group'] = node['root_group']

# TODO: https://www.papertrail.com/help/encrypting-remote-syslog-with-tls-ssl/#rsyslog
# Required: default["rsyslog"]["custom_remote"]
