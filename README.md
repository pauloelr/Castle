Pauloelr/Castle
===============

My collection of dotfiles, maintained through [homesick](https://github.com/technicalpickles/homesick).

Complete Installation
---------------------

```sh
curl -s https://raw.github.com/pauloelr/Castle/master/install_main.sh | bash
```

Note: You may be promped to enter information such as sudo password

Homesick Installation
---------------------

```sh
curl -s https://raw.github.com/pauloelr/Castle/master/install_user.sh | bash
```

Note: You may be promped to enter information such as sudo password

Standalone Instalation
----------------------

If you just want to clone this Castle with homesick do the following

```sh
# Clone Bash-it (if you did not clone yet)
git clone https://github.com/revans/bash-it.git ~/.bash_it

# Install homesick first (if you did not install yet)
gem install homesick

# Clone the Castle repository
homesick clone pauloelr/Castle

# Symlink the Castle to your home directory
homesick symlink Castle

# You can also enable plugins by running
curl -s https://raw.github.com/pauloelr/Castle/master/enable_bashit.sh | bash
```

Thanks
------

* [homesick](https://github.com/technicalpickles/homesick)
* [bash-it](https://github.com/revans/bash-it) for the _bash-it_ set of tools.
