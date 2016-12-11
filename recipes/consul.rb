include_recipe 'consul'

# TODO: remove the non-client bits
firewall_rule 'consul_dns' do
  protocol :tcp
  port     8600
  command  :allow
end
firewall_rule 'consul_http' do
  protocol :tcp
  port     8500
  command  :allow
end
firewall_rule 'consul_rpc' do
  protocol :tcp
  port     8400
  command  :allow
end
firewall_rule 'consul_serf_lan' do
  protocol :tcp
  port     8301
  command  :allow
end
firewall_rule 'consul_serf_wan' do
  protocol :tcp
  port     8302
  command  :allow
end
firewall_rule 'consul_server' do
  protocol :tcp
  port     8300
  command  :allow
end

