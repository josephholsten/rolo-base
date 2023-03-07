include_recipe 'yum-epel'


yum_repository 'ol9_developer_EPEL' do
  repositoryid 'oracle-epel-ol9'
  description 'Oracle Linux $releasever EPEL Packages for Development ($basearch)'

  baseurl 'https://yum$ociregion.$ocidomain/repo/OracleLinux/OL9/developer/EPEL/$basearch/'
  gpgkey 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-oracle'
  gpgcheck true
  enabled true
end

yum_repository 'epel' do
  repositoryid 'epel'
  description 'Oracle Linux $releasever EPEL Packages for Development ($basearch)'
  # description 'Extra Packages for 9 - $basearch'

  baseurl 'https://yum$ociregion.$ocidomain/repo/OracleLinux/OL9/developer/EPEL/$basearch/'
  # mirrorlist 'https://mirrors.fedoraproject.org/mirrorlist?repo=epel-9&arch=$basearch'
  mirrorlist nil
  gpgkey 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-oracle'
  # gpgkey 'https://download.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-9'
  gpgcheck true
  enabled true
  # fastestmirror_enabled=0
end

# Do NOT modify this file by hand.


# [ol9_developer_EPEL]
# name=Oracle Linux $releasever EPEL Packages for Development ($basearch)
