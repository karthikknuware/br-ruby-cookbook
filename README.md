# Ruby Cookbook

Installs and manages Ruby versions

0. [Recipes](#recipes)
0. [Attributes](#attributes)
0. [Maintainers](#maintainers)

## Recipes

### ruby::default

Runs `prepare`, `install`, and `clean` recipes.

### ruby::prepare

Prepares for Ruby installation by installing package dependencies and [ruby-build][ruby-build].

### ruby::install

Installs Ruby versions listed in `versions`.

### ruby::clean

Removes Ruby versions not listed in `versions`.

## Attributes

| Key | Type | Description |
|-----|------|-------------|
| `ruby`/`versions` | `Array of Strings` | List of Ruby versions to install |
| `ruby`/`path` | `String` | Path to install Ruby versions |
| `ruby`/`owner` | `String` | Owner of Ruby installation files |
| `ruby`/`group` | `String` | Group of Ruby installation files |
| `ruby`/`mode` | `String` | Mode of Ruby installation files |
| `ruby`/`dependencies` | `Array of Strings` | Packages needed to install Ruby |
| `ruby`/`gems` | `Array of Strings` | Gems to install immediately after Ruby is installed |
| `ruby`/`env` | `Hash` | Environment variables to use during Ruby install |
| `ruby`/`ruby-build`/`repository` | `String` | Location of `ruby-build` repository  |
| `ruby`/`ruby-build`/`revision` | `String` | Revision of `ruby-build` to use |
| `ruby`/`ruby-build`/`path` | `String` | Location where `ruby-build` will be installed |

[default values](attributes/default.rb)

## Maintainers

* [Jim Pruetting](https://github.com/jpruetting)

[ruby-build]: https://github.com/sstephenson/ruby-build
