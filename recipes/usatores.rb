execute 'ssh-keygen -t ed25519' do
  command "/usr/bin/ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ''"
  not_if { ::File.exist? '/etc/ssh/ssh_host_ed25519_key' }
end

user_name    = 'j'
user_comment = 'Joseph Anthony Pasquale Holsten'
user_shell   = '/usr/bin/ksh'
user_home    = "/home/#{user_name}"
user_ssh_keys = [
  'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINr+NtScZF5bGoEVD/S3PZgQEY3DKJlSkdeZUspuBRIn isha',
  'ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBP1QFEyvZ5VDRmDukmlgiL+8b27S1DJYY4kfgOhTvLrioN+DlJyBC5LhOiZPytLB/grfK/ETKzGhsZfLSPaiR4c= quaderno:blink',
  'ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBNGF1GKBRwA+y4ulkn6a6m6xSQjWpGqz6uOIwc+JibCVqKrtxZbrQqF3tnimGZJ7mOqWfUlgv3qv8pjc3Vt1FEs= venusta:blink',
]

user user_name do
  comment     user_comment
  home        user_home
  shell       user_shell
  system      false
  manage_home true
  action      :create
end

directory "#{user_home}/.ssh" do
  path        "#{user_home}/.ssh"
  owner       user_name
  group       user_name
  mode        '0700'
  recursive   true
  action      :create
end

template "#{user_home}/.ssh/authorized_keys" do
  cookbook    'base'
  source      'authorized_keys.erb'
  owner       user_name
  group       user_name
  mode        '0600'
  variables   :user => user_name,
    :ssh_keys => user_ssh_keys,
    :fqdn     => node['fqdn']
  action      :create
end

group 'admin' do
  members %w(j)
  append true
end
