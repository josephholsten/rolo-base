# package managers {
  # package "mas"      # mac app store
# }

# command shell {
  # package "bash"  # osx default is 3.2.57
  # package "dash"  # posix sh, now included in osx
    package "ksh"
  # package "zsh"   # osx ships with 5.7.1
  # package "zsh-completions"  # zsh shell completions
# }

# keg-only core tools {
  # package "bc"
  # package "cups"
  # package "file-formula"
  # package "ssh-copy-id"
# }

# core tools {
  # package "coreutils"        # gnu tooling, almost entirely for realpath
    package 'editorconfig' do  # improved modeline
      case node['platform_family']
      when 'freebsd'
        package_name 'editorconfig-core-c'
      else
        package_name 'editorconfig'
      end
    end
    package "parallel"        # improved xargs
  # package "pstree"          # improved ps
    package 'procps' do       # provides watch(1), improved while true do; ... done
      case node['platform_family']
      when 'freebsd'
        package_name 'gnu-watch'
      when 'rhel'
        package_name 'procps-ng'
      else
        package_name 'procps'
      end
    end

  # package "tree"            # improved ls -r
  # package "par"             # improved fmt
  # package "multitail"       # improved tail
  # package "less"            # improved more
  # package "nixpp"           # shorthands w/ posix fallbacks
  package 'stow' # dotfile installer
  package 'git'
  package 'vim' do
    case node[:platform]
    when 'redhat', 'centos', 'oracle'
      package_name 'vim-minimal'
    else
      package_name 'vim-tiny'
    end
  end
# }
    
# mobile-shell  improved ssh, see base::mosh

# terminal multiplexor {
    package "tmux"    # improved terminal emulator, posix tui
  # package "screen"
# }

# improved grep -r {
  # package "ack"
  # package "the_silver_searcher"    # ack -> c
  # package "the_platinum_searcher"  # ack -> go
    switch node[:platform_family]
    case 'rhel'
      yum_repository 'ripgrep' do
        name           'Copr repo for ripgrep owned by carlwgeorge'
        baseurl        'https://download.copr.fedorainfracloud.org/results/carlwgeorge/ripgrep/epel-7-$basearch/'
        gpgkey         'https://download.copr.fedorainfracloud.org/results/carlwgeorge/ripgrep/pubkey.gpg'
      end
    end
    package 'ripgrep'                # ack -> rust # FIXME github.com/BurntSushi/ripgrep
# }
  
# fuzzy item select (ia:seliger pie:leg la:lego la:seligo gmc:pikkōną gmc:keusaną gmc:plukkōną) {
  # github.com/emacs-helm/helm        # born:2007-07-22 (nee anything.el)
  # github.com/keiji0/canything       # born:2010-12-12, anything.el -> c
  # github.com/ctrlpvim/ctrlp.vim     # born:2011-06-20, -> vim
  # github.com/mooz/percol            # born:2011-02-26, -> python
  # github.com/garybernhardt/selecta  # born:2013-10-10, ctrlp.vim -> ruby 
  # github.com/junegunn/fzf           # born:2013-10-22, ctrlp.vim -> go
  # github.com/peco/peco              # born:2014-06-05, percol -> go
  # github.com/lotabout/skim          # born:2016-05-28, fzf -> rust
  # github.com/jhawthorn/fzy          # selecta -> c
# }

# improved cd(1) {
  # package "autojump" # born:2008-04-21
  # package "z"        # born:2009-06-18, autojump -> sh
  # package "fasd" # FIXME
# }

# file watching {
    package "fswatch" do    # file change events
      if platform_family?('rhel')
        if node['platform_version'].to_i == 9
          # epel 9 does not yet contain this package
          action :nothing
        end
      end
    end
  # package "watchexec"
  # package "watchr"
# }

# text manipulation {
    package "jq"              # json maniplation cli
  # package "miller"          # csv manlpulation cli
  # package "jo"              # json output
  # package "path-extractor"  # path extractor # FIXME github.com/edi9999/path-extractor
  # package "urlview"         # extract urls from emails
  # }

# compression {
  # package "unzip"     # born:1989-03-03, deflate
  # package "zip"       # born:1992-08, deflate 
  # package "ncompress" # born:1992-08-28, lzw
  # package "gzip"      # born:1992-10-31, deflate
  # package "bzip2"     # born:1996-07-18
  # package "7zip"      # born:1999-07-19
  # package "bsdcpio"   # born:2008-04-29
  # package "xz"        # born:2010-10-23, lzma
# }

## System Administration {{

  if platform_family?('rhel')
    # iotop is linux only
    package 'iotop'
  end
  package 'lsof'

# system call tracing {
  # freebsd: 'truss'
  # illumos: 'dtrace'
  if platform_family?('rhel')
    # strace is linux only
    package 'strace'
  end
# }


## }}

## Networking {{

  package "ipcalc"
  package "socat"         # improved nc

# packet capture {
  package 'tcpdump'
# }

# remote host analysis {
  package "mtr"  # improved ping
  package "nmap"
# }

# http client {
  # package "curl" # osx ships with 7.64.1
  # package "wget"
  # package "aria2"
# }

## }}


## Communication {{


## }}
