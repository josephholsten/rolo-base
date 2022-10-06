package 'mosh'

firewall_rule 'allow world to mosh' do
  protocol :udp
  port 60000..61000
  source '0.0.0.0/0'
end
