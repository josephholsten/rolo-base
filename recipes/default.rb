include_recipe 'ubuntu'
include_recipe 'sudo'
include_recipe 'git'
include_recipe 'papertrail'
include_recipe 'fail2ban'

firewall 'default'

# sub-recipes
include_recipe 'base::nolo'
include_recipe 'base::chef'
# include_recipe 'base::consul'
include_recipe 'base::user'

# crap I like
package 'fortune-mod'
package 'iotop'
package 'lsof'
package 'netcat'
package 'remind'
package 'socat'
package 'strace'
package 'tcpdump'
package 'tmux'
package 'vim-tiny'

# crap I dislike
package 'landscape-client' do
  action :remove
end
package 'landscape-client-ui' do
  action :remove
end
package 'landscape-client-ui-install' do
  action :remove
end
package 'landscape-common' do
  action :remove
end
