name 'base'

default_source :supermarket

run_list 'base::default'

cookbook 'base', path: '.'
cookbook 'chef_client_updater', '~> 3.12.3', :supermarket
