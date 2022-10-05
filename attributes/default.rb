default["base"]["chef_server_url"] = "https://api.chef.io/organizations/josephholsten"
default["base"]["chef_infra_version"] = "17"

default["authorization"]["sudo"]["groups"] = %w(admin wheel sudo)
default["authorization"]["sudo"]["users"] = %w(root)
default["authorization"]["sudo"]["passwordless"] = true
default["authorization"]["sudo"]["include_sudoers_d"] = true
default["authorization"]["sudo"]["agent_forwarding"] = true
default["authorization"]["sudo"]["sudoers_defaults"] = [
  'env_reset',
  'mail_badpass',
  'secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"'
]


default["fail2ban"]["logtarget"] = 'SYSLOG'

# TODO: https://www.papertrail.com/help/encrypting-remote-syslog-with-tls-ssl/#rsyslog
# Required: default["rsyslog"]["custom_remote"]
