maintainer       "LLC Express 42"
maintainer_email "info@express42.com"
license          "MIT"
description      "Installs/Configures base"
version          "0.1.0"

%w(apt user sudo).each do |dep|
  depends dep
end
