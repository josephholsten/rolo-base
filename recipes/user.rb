execute 'ssh-keygen -t ed25519' do
  command "/usr/bin/ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ''"
  not_if { ::File.exist? '/etc/ssh/ssh_host_ed25519_key' }
end

user_account 'j' do
  ssh_keys ['ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAmssfnJBsPnipuctMWvg746MLXytBOqk8P4moTgEJZSh6PZfCXcNULHiQTKFlQxUoXc0lczOdURUN1lOiTaoj+SAASKQfTD1AqsVVyxVGd//AlQOjY5ezDKas1dW1GEw4cmo6Myv+ShotPE2YYUu1th37ZPpgSuIRrq/9sAowG3FMjEgQjwKAk6G6fpvWiicUeLhMWYJ0EUO5SBZBu1sZelkivTTyyoiUBWJXnJUm89FRaYlN+2/J/2VSfVE4C977exoJuuRQbyCnRN46uIzeA1QwwGj3fd48IEzH29gDZfk6aKLmWpqLpbRwOEtLezqfd5An0lxlXSnOHBzcLaL34w==']
end

group 'admin' do
  members %w(j)
  append true
end
