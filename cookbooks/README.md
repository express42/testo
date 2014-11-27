# Cookbooks

This directory contains the cookbooks used to configure systems in your infrastructure with Chef.

Knife needs to be configured to know where the cookbooks are located with the `cookbook_path` setting. If this is not set, then several cookbook operations will fail to work properly.

```
cookbook_path ["./cookbooks"]
```

Configure knife to use your preferred copyright holder, email contact and license. Add the following lines to `.chef/knife.rb`.

```
cookbook_copyright "Example, Com."
cookbook_email     "cookbooks@example.com"
cookbook_license   "apachev2"
```

Supported values for `cookbook_license` are "apachev2", "mit","gplv2","gplv3",  or "none". These settings are used to prefill comments in the default recipe, and the corresponding values in the metadata.rb. You are free to change the the comments in those files.

# Knife cookbook

The knife cookbook subcommand is used to interact with cookbooks that are located on the Chef server or the local chef-repo.

```
$ knife cookbook download COOKBOOK_NAME [COOKBOOK_VERSION] (options)
$ knife cookbook upload [COOKBOOK_NAME...] (options)
$ knife cookbook delete COOKBOOK_NAME [COOKBOOK_VERSION] (options)
```
