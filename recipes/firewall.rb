firewall 'default' do
  ipv6_enabled true
  action       :install
end

firewall_rule 'allow loopback' do
  interface 'lo'
  protocol  :none
  command   :allow
end

firewall_rule 'allow icmp' do
  protocol :icmp
  command  :allow
end

firewall_rule 'allow world to ssh' do
  port   22
  source '0.0.0.0/0'
end

# allow established connections
firewall_rule 'established' do
  stateful [:related, :established]
  protocol :none # explicitly don't specify protocol
  command  :allow
end

# ipv6 needs ICMP to reliably work, so ensure it's enabled if ipv6
# allow established connections, ufw defaults to this but iptables does not
firewall_rule 'ipv6_icmp' do
  protocol :'ipv6-icmp'
  command  :allow
end
