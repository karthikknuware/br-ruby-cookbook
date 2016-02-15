# Ruby Cookbook

Installs and manages Ruby versions

0. [Overview](#overview)
0. [Recipes](#recipes)
0. [Attributes](#attributes)
0. [Examples](#examples)
0. [Maintainers](#maintainers)

## Overview

This cookbook is designed to provide consumers with a simple solution to add and remove Ruby versions from server or application nodes.

Required configuration has been kept to a minimum, so the only attribute you need to provide to get started is `ruby`/`versions`.

**Note:** Built by Robots is committed to maintaining a simple, robust set of cookbooks that can be used to deploy Ruby web applications in an enterprise setting. These open source projects will be humanely maintained and will not abrutly lose support. Any future transitions of ownership or deprecation will be handled with clear communication and plenty of advance notice.

## Recipes

### br-ruby::default

Runs `prepare`, `install`, and `clean` recipes.

### br-ruby::prepare

Prepares for Ruby installation by installing package dependencies and [ruby-build][ruby-build].

### br-ruby::install

Installs Ruby versions listed in `versions`.

### br-ruby::clean

Removes Ruby versions not listed in `versions`.

## Attributes

| Key | Type | Description |
|-----|------|-------------|
| `ruby`/`versions` | `Array of Strings` | List of Ruby versions to install |
| `ruby`/`install_path` | `String` | Path to install Ruby versions |
| `ruby`/`owner` | `String` | Owner of Ruby installation files |
| `ruby`/`group` | `String` | Group of Ruby installation files |
| `ruby`/`mode` | `String` | Mode of Ruby installation files |
| `ruby`/`dependencies` | `Array of Strings` | Packages needed to install Ruby |
| `ruby`/`gems` | `Hash` | Gems to install immediately after Ruby is installed |
| `ruby`/`env` | `Hash` | Environment variables to use during Ruby install |
| `ruby`/`ruby-build`/`repository` | `String` | Location of `ruby-build` repository  |
| `ruby`/`ruby-build`/`revision` | `String` | Revision of `ruby-build` to use |
| `ruby`/`ruby-build`/`install_path` | `String` | Path to install `ruby-build` |

[default values](attributes/default.rb)

## Examples

### Role

```json
{
  "name": "example",
  "chef_type": "role",
  "json_class": "Chef::Role",
  "description": "Example Role",
  "run_list": ["recipe[br-ruby::default]"],
  "default_attributes": {
    "ruby": {
      "versions": ["2.2.3", "2.1.7", "2.0.0-p647"]
    }
  }
}
```

## Maintainers

* [Jim Pruetting](https://github.com/jpruetting)

[ruby-build]: https://github.com/sstephenson/ruby-build
