sudo 'wheel' do
  groups    %w(admin wheel sudo)
  users     %w(root)
  nopasswd  true
  defaults [
    'env_reset',
    'mail_badpass',
    'secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"'
  ]
  action    :create
end
