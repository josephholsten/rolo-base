# support services
include_recipe 'base::chef'
include_recipe 'base::mosh'
include_recipe 'base::taliafoco'
include_recipe 'fail2ban'
include_recipe 'rsyslog::client'
# include_recipe 'base::consul'
# include_recipe 'base::nolo'

# system configuration
include_recipe 'base::usatores'
include_recipe 'base::utensiles'
include_recipe 'base::sudo'
