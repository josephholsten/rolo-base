unless platform_family?('rhel') && node['platform_version'].to_i == 9
  package 'mosh'

  firewalld_service 'mosh'
end
