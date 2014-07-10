siege Cookbook
==============
This cookbook installs siege software

Requirements
------------
### Supported Operating Systems
- Debian-family Linux Distributions
- RedHat-family Linux Distributions

### Cookbooks
- Depends on `checkinstall` cookbook
- When running on Rhel based systems, the node must include the `yum-epel` cookbook

Attributes
----------
### Recommended tunables

* `siege['install_method']`
  - String. Defaults to `source`. Can be `source` or `package`
  - `source` downloads source codes and compile them, then executes checkinstall to install as package
  - `package` installs package from the existing repo via apt or yum, depending on the distribution

* `siege['url']`
  - String. Points to the siege source codes archive location

* `siege['version']`
  - String. Siege version to be compiled

* `siege['checksum']`
  - String. Source codes archive checksum

### Source specific

* `siege['prefix_dir']`
  - String. The path to prefix dir
  - Defaults to `/`

* `siege['exec_prefix_dir']`
  - String. The path to exec_prefix dir
  - Defaults to `/usr`

* `siege['config_dir']`
  - String. The path to configuration file dir
  - Defaults to `/etc/siege`

* `siege['doc_dir']`
  - String. The path to docs dir
  - Defaults to `/usr/share/info`

* `siege['man_dir']`
  - String. The path man files dir
  - Defaults to `/usr/share/man`

* `siege['man_dir']`
  - Array. The configuration options to be included during compilation

Usage
-----
#### siege::default
Just include `siege` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[siege]"
  ]
}
```

License and Authors
-------------------

- Author:: Rostyslav Fridman (rostyslav.fridman@gmail.com)

```text
Copyright 2014, Rostyslav Fridman

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
