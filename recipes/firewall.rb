firewalld 'default'

firewalld_zone 'public' do
  interfaces node['network']['interfaces'].keys
  services [
    'dhcpv6-client',
    'ssh',
    'mosh'
  ]
end
