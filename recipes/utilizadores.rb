execute 'ssh-keygen -t ed25519' do
  command "/usr/bin/ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ''"
  not_if { ::File.exist? '/etc/ssh/ssh_host_ed25519_key' }
end

user_account 'j' do
  ssh_keys [
    'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINr+NtScZF5bGoEVD/S3PZgQEY3DKJlSkdeZUspuBRIn isha',
    'ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBP1QFEyvZ5VDRmDukmlgiL+8b27S1DJYY4kfgOhTvLrioN+DlJyBC5LhOiZPytLB/grfK/ETKzGhsZfLSPaiR4c= quaderno:blink',
    'ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBNGF1GKBRwA+y4ulkn6a6m6xSQjWpGqz6uOIwc+JibCVqKrtxZbrQqF3tnimGZJ7mOqWfUlgv3qv8pjc3Vt1FEs= venusta:blink',
  ]
end

group 'admin' do
  members %w(j)
  append true
end
