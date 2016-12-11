include_recipe 'chef-client'
include_recipe 'chef-client::delete_validation'
include_recipe 'chef-client::config'
include_recipe 'omnibus_updater'

template '/etc/chef/client.d/syslog.rb' do
  source 'chef-syslog.rb.erb'
  mode 00644
  notifies :create, 'ruby_block[reload_client_config]'
end

