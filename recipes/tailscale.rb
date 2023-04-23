# tailscale: red private
# vide https://tailscale.com/download

# configure repo
case node['platform_version']
when 'rhel'
  # dnf config-manager --add-repo https://pkgs.tailscale.com/stable/rhel/9/tailscale.repo
  yum_repository 'tailscale' do
    repositoryid   'tailscale-stable'
    name           'Tailscale stable'
    baseurl        'https://pkgs.tailscale.com/stable/rhel/9/$basearch'
    type           'rpm'
    repo_gpgcheck  true
    gpgkey         'https://pkgs.tailscale.com/stable/rhel/9/repo.gpg'

  # gpgcheck       true 
    gpgcheck       false

  # enabled        true
  # clean_metadata true
  # make_cache true
  # mode 0644
  # reposdir '/etc/yum.repos.d/'
  end
else
# debian:
#   curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.noarmor.gpg | 
#     tee /usr/share/keyrings/tailscale-archive-keyring.gpg 
#   curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.tailscale-keyring.list | 
#     tee /etc/apt/sources.list.d/tailscale.list
end

package 'tailscale'

service 'tailscaled' do
  action :enable
end

# authenticate
# tailscale up --authkey={{authkey}}
