# Packer

Packer is a tool for building identical machine images for multiple platforms
from a single source configuration.

## Quick Start

First, [download a pre-built Packer binary](http://www.packer.io/downloads.html)
for your operating system or [compile Packer yourself](#developing-packer).

After Packer is installed, tell Packer to build the image:

```
$ packer build -var root_password=<PASSWORD> ubuntu64.json
...
```

## Documentation

Full, comprehensive documentation is viewable on the Packer website:

http://www.packer.io/docs
