default["base"]["chef_server_url"] = "https://api.chef.io/organizations/josephholsten"
default["base"]["chef_infra_version"] = "17"

default["fail2ban"]["logtarget"] = 'SYSLOG'

# TODO: https://www.papertrail.com/help/encrypting-remote-syslog-with-tls-ssl/#rsyslog
# Required: default["rsyslog"]["custom_remote"]
