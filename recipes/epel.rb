include_recipe 'yum-epel'


yum_repository 'ol9_developer_EPEL' do
  repositoryid 'oracle-epel-ol9'
  description 'Oracle Linux $releasever EPEL Packages for Development ($basearch)'

  baseurl 'https://yum$ociregion.$ocidomain/repo/OracleLinux/OL9/developer/EPEL/$basearch/'
  gpgkey 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-oracle'
  repo_gpgcheck true
  enabled true
end

# [ol9_developer_EPEL]
# name=Oracle Linux $releasever EPEL Packages for Development ($basearch)
