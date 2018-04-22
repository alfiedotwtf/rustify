# NAME

rustify - Convenience script to install Rust with all the trimmings inside Docker

# DESCRIPTION

rustify is a convenience script to create a Rust development environment inside
a Debian Docker container:

    * Build Docker image
    * Run Docker container
    * Install Rust
    * Setup Vim syntax highlighting
    * Setup Racer with Vim integration for autocomplete
    * Setup rustfmt with Vim integration for autoformat

If there's anything else you think would be useful, send a pull request and
i'll be happy to merge.

# INSTALLATION

The first thing to do is build the Docker image. This only has to be done once:

    $ make build-docker

Once the Docker image has been built, run the Docker container and install the world:

    $ make run-docker
    # /srv/rustify/rustify.sh

# USAGE

Now that everything has been setup, it's ready to be used. Each time you want to do some Rust:

    $ make run-docker
    # <insert-rust-development>

# SUPPORT

Please report any bugs or feature requests at:

* [https://github.com/alfiedotwtf/rustify/issues](https://github.com/alfiedotwtf/rustify/issues)

Watch the repository and keep up with the latest changes:

* [https://github.com/alfiedotwtf/rustify/subscription](https://github.com/alfiedotwtf/rustify/subscription)

Feel free to fork the repository and submit pull requests :)

# SEE ALSO

* [Rust](https://www.rust-lang.org/)
* [Vim](http://www.vim.org/)

# AUTHOR

[Alfie John](https://www.alfie.wtf)

# WARRANTY

IT COMES WITHOUT WARRANTY OF ANY KIND.

# COPYRIGHT AND LICENSE

Perpetual Copyright (C) to Alfie John

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see [http://www.gnu.org/licenses/](http://www.gnu.org/licenses/).
