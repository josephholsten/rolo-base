include_recipe 'ubuntu'
include_recipe 'sudo'
include_recipe 'fail2ban'
include_recipe 'rsyslog::client'

# sub-recipes
# include_recipe 'base::firewall'
# include_recipe 'base::nolo'
include_recipe 'base::chef'
# include_recipe 'base::consul'
include_recipe 'base::user'

# crap I like
include_recipe 'base::tools'

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



