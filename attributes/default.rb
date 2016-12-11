default.authorization.sudo.groups = %w(admin wheel sudo)
default.authorization.sudo.users = %w(root)
default.authorization.sudo.passwordless = true
default.authorization.sudo.include_sudoers_d = true
default.authorization.sudo.agent_forwarding = true
default.authorization.sudo.sudoers_defaults = [
  'env_reset',
  'mail_badpass',
  'secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"'
]

default.chef_client.config.ssl_verify_mode = 'verify_peer'
default.chef_client.config.log_location = false
default.chef_client.config.client_fork = true

default.fail2ban.logtarget = 'SYSLOG'

default.papertrail.remote_port = 20325

default.omnibus_updater.force_latest = true


