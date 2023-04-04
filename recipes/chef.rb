# chef: ensure chef
# - package is updated
# - service is configured, &
# - service is scheduled

if platform_family?('debian') or platform_family?('rhel')
  chef_client_updater 'Install latest Chef Infra Client' do
    version '18'
    product_name 'cinc'
    rubygems_url 'https://packagecloud.io/cinc-project/stable'
  end
else
  # TODO: native package on FreeBSD
  Chef::Log.warn "chef_client_updater/omnibus not configured on platform_family:#{node[:platform_family]}"
end

chef_client_config 'Chef Infra Client Config' do
  chef_license      'accept'
  chef_server_url   node['base']['chef_server_url']
  log_location      :syslog
  action            :create
end


if platform_family?('debian') or platform_family?('rhel')
  chef_client_systemd_timer 'Chef Infra Client timer' do
    accept_chef_license  true
    chef_binary_path     '/usr/bin/chef-client'
    action               :add 
  end
else
  # TODO: chef_client_cron on FreeBSD, illumos, Solaris
  # TODO: chef_client_launchd on macOS
  Chef::Log.warn "chef_client_systemd_timer not configured on platform_family:#{node[:platform_family]}"
end
