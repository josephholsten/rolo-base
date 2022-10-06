# package managers {
  # package "mas"      # mac app store
# }

# command shell {
  # package "bash"  # osx default is 3.2.57
  # package "dash"  # posix sh, now included in osx
    package "zsh"   # osx ships with 5.7.1
  # package "zsh-completions"  # zsh shell completions
# }

# keg-only core tools {
  # package "bc"
  # package "cups"
  # package "file-formula"
  # package "ssh-copy-id"
# }

# core tools {
  # package "coreutils"     # gnu tooling, almost entirely for realpath
    package "editorconfig"  # improved modeline
    package "parallel"      # improved xargs
  # package "pstree"        # improved ps
    package "watch" do      # improved while true do; ... done
      case node[:platform]
      when 'redhat', 'centos', 'oracle'
        package_name 'procps-ng'
      else
        package_name 'watch'
      end
    end
  # package "tree"          # improved ls -r
  # package "mobile-shell"  # improved ssh
  # package "par"           # improved fmt
  # package "multitail"     # improved tail
  # package "less"          # improved more
  # package "nixpp"         # shorthands w/ posix fallbacks
# }

# improved terminal emulator {
  # package "xterm"
  # package "iterm2"  # improved terminal emulator, macos ui
    package "tmux"    # improved terminal emulator, posix tui
  # package "hyper"
  # package "screen"
# }

# improved grep -r {
  # package "ack"
  # package "the_silver_searcher"    # ack -> c
  # package "the_platinum_searcher"  # ack -> go
  # package "ripgrep"                # ack -> rust # FIXME github.com/BurntSushi/ripgrep
# }
  
# fuzzy item select (pie:leg la:lego la:seligo gmc:pikkōną gmc:keusaną gmc:plukkōną) {
  # - helm.el (nee anything.el) # born:2007-07-22
  # - canything    # born:2010-12-12, anything.el -> c
  # - ctrlp.vim    # born:2011-06-20
  # package "percol"  # born:2011-02-26
  # package "fzf"     # born:2013-10-22, ctrlp.vim -> go # FIXME github.com/junegunn/fzf
  # package "peco"    # born:2014-06-05, percol -> go
# }

# improved cd(1) {
  # package "autojump" # born:2008-04-21
  # package "z"        # born:2009-06-18, autojump -> sh
  # package "fasd" # FIXME
# }

# file watching {
    package "fswatch" do    # file change events
      if platform_family?('rhel')
        case node[:platform_version]
        when 9
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

# stores {
  # package "arq"     # backups
  # package "dropbox" # file store sync
  # package "keybase" # secure file store
  # package "ledger"  # accounting store
    package "stow"    # dotfile store
# }

# password store {
  # package "pass"         # password store, cli
  # package "1password"    # password store, gui
  # package "keepassx"     # password store, foss, gui

  # package "oath-toolkit"         # otp generator
  # package "pwgen"
# }

# launcher {
  # package "launchbar"    # born:1996
  # package "quicksilver"  # born:2003-12-02
  # package "alfred"       # born:2010-03-03
# }

# ui
# package "hammerspoon" # window manip ui
# - gpgtools    # encryption ui

# self-stalking
# package "imagesnap"      # laptop camera cli
# package "sleepwatcher"   # wakeup events
# - nolo # meter -> sink adopters
# - selfspy
# - andrewning / sortphotos
# - nwinter/telepath-logger
# package "terminal-notifier" 

# botrus dev
# - bsdiff # binary diff
# - perceptualdiff # image cmp
# - xdelta # binary diff
# - tag # osx file tag manip
# - influxdb # timeseriesdb


## System Administration {{

  package 'iotop'
  package 'lsof'
# package "htop"         # improved top
# package "appcleaner"   # app removal
# package "malwarebytes" # antivirus
# package "flock"        # file locking
# package "docker"       # containers

# system call tracing {
  # package 'truss'
    package 'strace'
  # package 'dtrace'
# }

# disk analysis {
  # package "gemini"          # deduplication
  # package "daisydisk"       # fs usage viz
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

# parallel ssh {
  # package "pdsh"   # born:1998-09-04, parallel distributed shell
  # package "dsh"    # born:2001-05-13, dancer's shell (unmaintained)
  # package "mussh"  # born:2001-06-02, multihost ssh (unmaintained)
  # package "pssh"   # born:2003-08-16, parallel ssh (unmaintained)
  # package "mpssh"  # born:2008-06-05, mass parallel ssh
  # package "ppss"   # born:2009-01-04, parallel processing shell script (unmaintained)
  # package "hss"    # born:2017-10-15
  # go get github.com/reconquest/orgalorg
  # pip install parallel-ssh
  # pip3 install git+https://github.com/google/paramgmt.git
  #
  # cluster-ssh  # born:2002-12-??, xterm multiplexer
  # csshX        # born:2009-03-03, -> OS X
  # i2cssh       # born:2011-06-12, -> iTerm2
  # tmux-cssh    # born:2017-05-17, -> tmux
# }

# network file transport {
  # package "transmission"       # bittorent
  # package "transmit"           # sftp
  # package "cyberduck"          # foss sftp
# }

# VPN clients {
  # package "viscosity"    # OpenVPN Client
  # package "tunnelblick"  # OpenVPN Client
  # package "shimo"        # OpenVPN Client
  # package "private-internet-access"
# }

## }}

## Programming {{

# package "flex"
# package "bison"
# package "awk"   # osx ships with 20070501
# package "sqlite"
# package "m4"
# mas  "Xcode", id: 497799835
# package "clib"
# package "cscope"
# package "dash"         # Documentation Viewer


# shell {
  # package "shellcheck" # sh linter # FIXME github.com/koalaman/shellcheck
  # package "shfmt"
# }

# C {
# package "splint" # secure programming lint
# } 

# ruby {
# package "ruby"     # osx ships with 2.6.3p62
# package "ruby-install"
# }

# python {
# package "python"   # osx ships with 3.7.3
# }

# go {
# package "go"       # required for go get
# - godef
# - gofmt
# - goimports
# - golint
# - gotags
# - guru
# }

# node {
# package "node"     # required for npm
# }

# tag search {
  package "ctags" # osx default is bsd
# }

# version control systems {
  # all rcs supported by hig
  # package "rcs"        # conflicts on ci(1), co(1)
  # package "cvs"
  # package "bazaar"
  # package "darcs"
  # package "mercurial"
    package 'git'        # osx ships with 2.3.2, which is ancient
  # package "hub"        # github cli   # FIXME: github.com/github/hub
  # package "ghq"        # rcs store    # FIXME: github.com/x-motemen/ghq
  # package "hig"        # multi-rcs ui # FIXME: github.com/josephholsten/hig
# }

## }}

## Writing Tools {{

  # package "graphviz" # diagramming

# improved vi / text editor {
  package 'vim' do
    case node[:platform]
    when 'redhat', 'centos', 'oracle'
      package_name 'vim-minimal'
    else
      package_name 'vim-tiny'
    end
  end
  
  package "neovim"

  # package "visual-studio-code" # graphical text editor
  # package "atom"             # text editor
# }

# improved word processor {
  # mas "Pages", id: 409201541
  # mas "iA Writer", id: 775737590
# }

# document authoring {
  # package "sphinx-doc" # reStructuredText
# }

# markdown processing {
  # package "pandoc"          # text document convertion FIXME: pandoc.org
  # package "hugo"
  # package "commonmark"
  # package "qlmarkdown"
  # package "marked"
# } 

# html processing {
  # package "prince"      # html to pdf
# }

# bibliography management {
  # package "papers"             # biblio mgmt
# }

# }}

# slide deck presentation {
  # mas  "Keynote", id: 409183694
# }

# spreadsheets {
  # mas  "Numbers", id: 409203825
# }


# task management {
  # package "todoman"
  # package "task"                 # taskwarrior
  # mas  "Todoist", id: 585829637 # family lists
  # package 'remind'
  # package "rem"
# }

# knowledge management {
  # package "workflowy"    # outlining / external brain
  # obsidian
  # roam
  # dendron
# }

# audio creation & management {{
  # package "tuneup"             # music tagging
  # package "musicbrainz-picard" # music tagging
  # mas  "GarageBand", id: 682658836
  # mas  "Audiobook Binder", id: 413969927
# }}

# image creation & management {{
  # package "photosweeper-x"
  # package "mylio"           # photo store
    package "exiftool" do      # image metadata cli
      case node[:platform]
      when 'redhat', 'centos', 'oracle'
        package_name 'perl-Image-ExifTool'
      else
        package_name 'watch'
      end
    end
  # package "imagemagick" # image manip
# }}

# video creation & management {{
  # package "obs"
  # mas  "iMovie", id: 408981434
  # package "handbrake"   # dvd encoding
# }}

## Communication {{

# browser {
  # package "firefox"        # original browser

  # package "brave-browser"  # fallback
  # package "google-chrome"  # fallback
  # package "tor-browser"    # anonymous browser, tor + web browser
  # package "lynx"            # html to text # FIXME
# }
 
# chat {
  # package "slackcat"
  # package "franz"    # chat ui, instant messaging
  # package "adium"    # instant messaging
  # package "textual"  # irc, macos gui
  # package "slack"    # sous-chefs, hangops chat
  # package "discord"
  # package "signal"   # secure messaging
# }

# video chat {
  # package "skype"
  # package "zoomus"  # video chat
# }

# news {
  # package "panic-unison"  # usenet
  # package "netnewswire"
# }

# mail sync {
  # package "offlineimap"  # mail store sync # FIXME
# }
  
# mail reading & writing {
    package "mutt"     # maildir ui
  # package "notmuch"
# }

# calendar sync {
  # package "vdirsyncer"  # card/cal store sync # FIXME
# }

# package "khal"  # vcal ui

# contacts database {   
  # package "khard"            # vcard ui # FIXME
# }

## }}

# games {
    package "fortune-mod"
  # package "sabaki"   # go board
  # package "steam"    # gaming marketplace
  # package "nethack"  # the game  
  # package "battle-net"
# }


# package "gnu-typist"         # typing lessons

# package "anki"
# package "calibre"            # ebook mgmt
# package "hasklig"            # ligatures 
# package "electric-sheep"     # the screensaver
# package "family-tree-maker"  # geneology store
# package "flux"
# package "karabiner-elements" # key bindings
# package "keepingyouawake"    # prevent sleep events
# package "qrencode"

# mas  "Timer", id: 799574890

