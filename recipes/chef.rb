chef_client_systemd_timer 'Chef Infra Client timer' do
  accept_chef_license      true
  chef_binary_path         "/usr/bin/chef-client"
# config_directory         "/etc/chef"
# user                     "root"
# job_name                 "chef-client"
# description              "Chef Infra Client periodic execution"
# delay_after_boot         "1min"
# interval                 "30min"
# splay                    "5min"
  action                   :add 
end

chef_client_config 'Chef Infra Client Config' do
  chef_license      'accept'
  chef_server_url   node['base']['chef_server_url']
  log_location      :syslog
  action            :create
  
# file_backup_path  '/var/lib/chef'
# log_level         :info
# node_name         node.name
# ssl_verify_mode   :verify_peer
# user              'root'
end

chef_client_updater 'Install latest Chef Infra Client 17.x' do
  version '17'
end
