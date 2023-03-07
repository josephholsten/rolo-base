include_recipe 'yum-epel'

if platform?('oracle')
  if node['platform_version'].to_i == 9
    yum_repository 'epel' do
      repositoryid 'epel'
      description 'Oracle Linux $releasever EPEL Packages for Development ($basearch)'
      baseurl 'https://yum$ociregion.$ocidomain/repo/OracleLinux/OL9/developer/EPEL/$basearch/'
      mirrorlist nil
      fastestmirror_enabled nil
      gpgkey 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-oracle'
      gpgcheck true
      enabled true
    end
  end
  
  file '/etc/yum.repo.d/oracle-epel-ol9.repo' do
    action :delete
  end
end
