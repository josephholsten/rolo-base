include_recipe 'base::epel'

package 'mosh'

# ensure base::firewall has service 'mosh' in the active zone
