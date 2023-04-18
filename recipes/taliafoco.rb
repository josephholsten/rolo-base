if platform_family?('debian') or platform_family?('rhel')
  firewalld 'default'

  firewalld_zone 'public' do
    interfaces node['network']['interfaces'].keys
    services [
      'dhcpv6-client',
      'ssh',
      'mosh'
    ]
  end

  include_recipe 'fail2ban'
else
  # TODO: PF on OpenBSD, macOS, FreeBSD, Solaris
  # TODO: IPF on Illumos
  Chef::Log.warn "Firewall not configured on platform_family:#{node[:platform_family]}"
end