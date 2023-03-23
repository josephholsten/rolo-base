# chef: ensure chef
# - package is updated
# - service is configured, &
# - service is scheduled

chef_client_updater 'Install latest Chef Infra Client' do
  version '18'
  product_name 'cinc'
end

chef_client_config 'Chef Infra Client Config' do
  chef_license      'accept'
  chef_server_url   node['base']['chef_server_url']
  log_location      :syslog
  action            :create
end

chef_client_systemd_timer 'Chef Infra Client timer' do
  accept_chef_license  true
  chef_binary_path     '/usr/bin/chef-client'
  action               :add 
end
