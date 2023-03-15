include_recipe 'yum-epel'

if platform?('oracle')
  file '/etc/yum.repo.d/oracle-epel-ol9.repo' do
    action :delete
  end
end
