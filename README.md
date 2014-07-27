Kitchen Nightmare
=================

Chef project used to configure and update ubuntu server.

*Recipes*
---------

### *Change server hostname*

-   Change hostname to match default site name (one site/one server)

### *Update server default packages*

-   Update server packages

### *Install necessary packages*

-   Install packages required by project(s) environment.
    -   build-essential: Package necessary to install Ruby and most of
        necessary elements.
    -   vim-nox: Prefered version of vim to replace default installed on
        Ubuntu server.
    -   bash-completion: Better completion for bash.
    -   multitail: Package allowing to “tail” multiple files at the same
        time.
    -   htop: Better service monitoring.
    -   multitee: Send multiple inputs to multiple outputs (Is it
        useful?).
    -   nmap: Network Mapper (Useful but is it used?).
    -   cURL: Command line tool for getting or sending files using URL
        syntax.
    -   tree: Package allowing to display directory tree view.
    -   telnet: Command used for interactive communication with another
        host using the TELNET protocol.
    -   unzip: Package allowing to decompress zip files.
    -   wget: Network utility to retrieve files from the Web using
        http(s) and ftp, the two most widely used Internet protocols.
    -   ack-grep: Tool allowing to search information into files.
    -   default-jre: Java open package.
    -   libxml2: Library allowing to manage XML files.
    -   libxml2-dev: Development library for libxml2.
    -   libjpeg-turbo8: IJG JPEG compliant runtime library
    -   libjpeg-turbo8-dev: Development library for libjpeg-turbo8.
    -   libpng12-0: PNG library - runtime.
    -   libpng12-dev: Development library for libpng12-0.
    -   libjasper1: JasPer JPEG-2000 runtime library.
    -   libjasper-dev: Development library for libjasper1.
    -   libltdl7-dev: A system independent dlopen wrapper for GNU
        libtool.
    -   libssl-dev: OpenSSL library.
    -   libcurl4-openssl-dev: Development files and documentation for
        libcurl (OpenSSL).
    -   libexpat1-dev: Development library for XML parsing C library.
    -   libfreeimage-dev: Support library for graphics image formats
        (development files).
    -   gettext: GNU Internationalization utilities.
    -   ruby-dev: Header files for compiling extension modules for Ruby
        (default version - Ruby 1.9.3-p194)
    -   ghostscript: interpreter for the PostScript language and for
        PDF.

-   Install ImageMagick from source, library allowing to create and
    manipulate images.

### *Configure default users environment using configuration files loaded at user login*

-   bashrc: Configuration file for bash.
-   vimrc: Configuration file for Vim.
-   irbrc: Configuration file for IRB.
-   gemrc: Configuration file for Gem.
-   gitconfig: Default Git configuration file.
-   environment: Default environment settings file (/etc/environment).

### *Install and configure Ntpdate*

-   Install Ntpdate package.
-   Set Ntpdate cronjob

### *Install and configure Postfix server (library allowing to send and receive emails)*

-   Install Postfix package.
-   Configure Postfix settings

### *Install and configure FTP server (library allowing to manage FTP protocol)*

-   Install ProFTPd.
-   Configure ProFTPd.

### *Install and configure server default versioning system (Git)*

-   Setup Git.

### *Install and configure Fail2Ban*

-   Install Fail2Ban from package.
-   Setup configuration files.

### *Install and configure Memcache (caching server)*

-   Install Memcache from package.
-   Setup memcache configuration file.

### *Install and configure Redis (caching server)*

-   Install Redis from package.

### Install and configure default database.

-   Install MySQL database from package.
-   Configure MySQL database.

### Install and configure Apache2 web server.

-   Install Apache2 from package.
-   Install needed Apache2 modules:
    -   mod\_xsendfile (xsendfile): A small Apache2 module that
        processes X-SENDFILE headers registered by the original output
        handler.
    -   proxy\_http: Apache2 http proxy module.
    -   mod\_rewrite (rewrite): Apache2 module allowing to rewrite URL.
    -   mod\_proxy (proxy): Apache2 proxy module.
    -   expires
    -   headers
    -   proxy\_balancer

### Install…

<br />

*Commands*
----------

### Knife commands

-   Prepare Vagrant VM by uploading necessary elements (Chef version and
    cookbooks)
-   knife solo prepare -N <node_name> -i
    \~/.vagrant.d/insecure\_private\_key -p 2222 vagrant@127.0.0.1

*Project Environment*
---------------------

### Vagrant

-   Vagrant must be downloaded from official
    [website](http://vagrantup.com/)

### Virtualbox

-   Vagrant must be downloaded from official
    [website](http://virtualbox.org/)

### Berkshelf

-   The project is using Berkshelf to manage it’s dependencies
    (cookbooks) and directories so the Berkshelf ruby gem must be
    installed on the machine by following the indication of the official
    [website](http://berkshelf.com/)

### Virtual Machine Box

-   Boxes can be downloaded from Vagrant list of availables boxes
    <http://www.vagrantbox.es/> or created using tools allowing to
    create boxes from original ISO file (ex:
    [bento](https://github.com/opscode/bento/),
    [packer](https://github.com/mitchellh/packer),
    [vanilla-boxes](https://github.com/teohm/vanilla-boxes),
    [veewee](https://github.com/jedi4ever/veewee), etc…).

*Project Settings*
------------------

### Vagrantfile

-   Used to manage virtual machine default settings and can be used to
    bootstrap project (unless user wants the project to be managed
    manually the way a real server could be.).

-   Due to some trouble loading VM Guest Additions with Ubuntu some
    lines could be added to the Vagrantfile:

  ```ruby
  # Custom for Virtualbox Guest Additions
  class HackyGuestAdditionsInstaller < VagrantVbguest::Installers::Ubuntu
      def install(opts=nil, &block)
        super
        super_garbage_hack = <<-EOF
    if [ ! -e /usr/lib/VBoxGuestAdditions ]; then
      sudo ln -s /opt/VBoxGuestAdditions-4.3.12/lib/VBoxGuestAdditions \
        /usr/lib/VBoxGuestAdditions || true
    fi
    EOF
        communicate.sudo(super_garbage_hack)
      end
  end
  # Custom
  ```
  - And a vagrant plugin should be installed by using the following command:

      ```bash
      vagrant plugin install <plugin_name>
      ```
    - vagrant-vbguest

- If project must managed by Vagrant some more settings should be done:
  - Installing some useful Vagrant plugins:
    - chef
    - vagrant-omnibus
  - Configuring Chef project settings in the Vagrantfile by adding:
    - This block before the Vagrant configuration block.

      ```ruby
      # Custom Chef Node management
      Chef::Config.from_file(File.join(File.dirname(__FILE__), '.chef', 'knife.rb'))
      vagrant_json = JSON.parse(Pathname(__FILE__).dirname.join('nodes', (ENV['NODE'] || 'kn_deployer.json')).read)
      # Custom
      ```

    - Uncomment and fill chef_solo block inside the Vagrant one (following the commented lines could be useful :D):

      ```ruby
      config.vm.provision "chef_solo" do |chef|
        # Chef configuration
        chef.cookbooks_path = Chef::Config[:cookbook_path]
        chef.roles_path = Chef::Config[:role_path]
        chef.data_bags_path = Chef::Config[:data_bag_path]
        chef.environments_path = Chef::Config[:environment_path]

        # Chef node run_list
        chef.run_list = vagrant_json.delete('run_list')

        chef.json = vagrant_json
      end
      ```
    - Because of the new setting some requirements must be added (at the top of the file of course):

      ```ruby
      require 'chef'
      require 'json'
      ```


### Berkfile

### Gemfile

-   Used to version ruby gem used in the project



<br>
<br>
<br>
