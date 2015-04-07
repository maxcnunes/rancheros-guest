# rancheros-guest

Vagrant guest plugin for Rancher OS.

While Vagrant does not have embedded support for Rancher OS ([list available guests](https://github.com/mitchellh/vagrant/tree/master/plugins/guests)). This plugin configures the Rancher OS guest on vagrant.


# Installing

```bash
# clone this project and build the gem
rake build

# intall the local gem
vagrant plugin install pkg/rancheros-guest-<version>.gem
```
