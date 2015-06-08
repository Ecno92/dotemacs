=================
My Emacs dotfiles
=================

Authors
=======

This .emacs files repository was forked from `pennersr's <https://github.com/pennersr/>`_ dotfile
repository which you can find `here <https://github.com/pennersr/dotemacs>`_.

After a while this repo became different that's why this is now a dedicated repository.

The files are a combination of own contributions and stuff that was found on the internet.
All the authors can be found by using your favourite search engine.

Target audience
===============

This repository is designed for me. So it's the Emacs configuration that I like.
However you may also like it if:

* You're a web developer who uses Python/Django, JS, and now and then some PHP.
* You want to learn some new coding languages like `Rust <http://www.rust-lang.org/>`_.
* You are used to some shortcuts for things like redoing an edit and you want to use it the easy way.
* You like a theme that is fairly fancy and easy on the eyes.
* You may use this on Ubuntu.

So try it! Fork it if you want to keep your own version!

Installation
============

1. Install Emacs:
   * Debian based desktop: ``$ sudo apt-get install emacs24``
   * Debian based server: ``$ sudo apt-get install emacs24-nox``
   * Mac OSX: `Just check this page <http://www.emacswiki.org/emacs/EmacsForMacOS#toc12>`_
2. Move into the home directory. ``$ cd ~``
3. Clone my repo or your own fork. ``$ git clone https://github.com/Ecno92/dotemacs .emacs.d``
4. Move into the directory ``$ cd .emacs.d/``
5. Execute the install command in the Makefile which installs `Cask <https://cask.github.io/>`_ and your complete environment. ``$ make install``
   * Take a look at the ``Makefile``. The next time you can just run ``make cask`` to update your dependencies.
6. Run emacs! ``$ emacs``

Useful resources
=================

* `Emacs @ StackExchange <https://emacs.stackexchange.com/>`_
* `Magit Cheatsheet <http://daemianmack.com/magit-cheatsheet.html>`_
* `Video tutorial Magit (Git Client) <https://vimeo.com/2871241>`_
* `Emacs Reference Card (Cheatsheets) <https://www.gnu.org/software/emacs/refcards/pdf/refcard.pdf>`_

Contributions
=============

Although dotfiles are very personal I'm always open for cool suggestions.
Just open a Pull-request and I'll accept it if I like it.