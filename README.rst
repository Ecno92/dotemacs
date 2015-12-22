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
* You are used to some shortcuts for things like redoing an edit and you want to use it the easy way.
* You like a theme that is fairly fancy and easy on the eyes.
* You are using Ubuntu or another Debian based Linux distribution.

So try it! Fork it if you want to keep your own version!

Installation
============

**WARNING:** Ubuntu is the only supported OS.

1. Install Emacs *(24.4 or higher)*:

   * Debian based desktop: ``$ sudo apt-get install emacs24``

   * Debian based server: ``$ sudo apt-get install emacs24-nox``

   * In case Emacs 24.4 is not available in your repositories check out the
     ``install-emacs-from-source`` command in the Makefile.


2. Move into the home directory. ``$ cd ~``
3. Clone my repo or your own fork. ``$ git clone https://github.com/Ecno92/dotemacs .emacs.d``
4. Move into the directory ``$ cd .emacs.d/``
5. Execute the install command in the Makefile which installs `Cask <https://cask.github.io/>`_ and your complete environment. ``$ make install``

   * Take a look at the ``Makefile``. The next time you can just run ``$ make cask`` to update your dependencies.

6. Run emacs! ``$ emacs``


List of Dependencies
====================

Some dependencies have to be installed in order to make this environment work well.
The installation of those dependencies is not covered in this *dotfile* repository since
the installation procedure may change over time. ::

  * JS Beautify (NPM)
  * pep8 (PIP)
  * flake8 (PIP)
  * yapf (PIP)
  * gettext-el (APT)
  * graphviz (APT)

Usage (incomplete)
==================

* ``C-x C-j`` Direx
* ``C-/`` Undo
* ``C-x C-/`` Redo
* ``M-x browse-at-remote`` Browse at remote (Github/BitBucket)
* ``C-x g`` Magit Status

Useful resources
================

* `Emacs @ StackExchange <https://emacs.stackexchange.com/>`_
* `Magit Cheatsheet <http://daemianmack.com/magit-cheatsheet.html>`_
* `Video tutorial Magit (Git Client) <https://vimeo.com/2871241>`_
* `Emacs Reference Card (Cheatsheets) <https://www.gnu.org/software/emacs/refcards/pdf/refcard.pdf>`_
* `Awesome Emacs - List of awesome packages, libraries and links <https://github.com/emacs-tw/awesome-emacs>`_
* `Aaron Bedra's Emacs 24 Configuration <http://www.aaronbedra.com/emacs.d/>`_

Contributions
=============

Although dotfiles are very personal I'm always open for cool suggestions.
Just open a pull-request and I'll accept it if I like it.
