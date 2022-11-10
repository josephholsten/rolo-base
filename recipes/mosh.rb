unless platform_family?('rhel') && node['platform_version'].to_i == 9
  package 'mosh'

  # ensure base::firewall has service 'mosh' in the active zone
end
