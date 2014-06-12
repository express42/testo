#
# Cookbook Name:: base
# Recipe:: default
#
# Author:: LLC Express 42 (info@express42.com)
#
# Copyright (C) LLC 2012 Express 42
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

class Chef::Recipe
  include Express42::Base::Network
end

=begin
apt_repository "precise" do
    action :add
    uri 'http://mirror.yandex.ru/ubuntu'
    distribution "squeeze"
    components ['main', 'contrib', 'non-free']
    notifies :run, resources(:execute => "apt-get-update"), :immediately
end

apt_repository "precise-updates" do
    action :add
    uri 'http://mirror.yandex.ru/ubuntu'
    distribution "precise-updates"
    components ['main', 'universe', "multiverse"]
end

apt_repository "precise-security" do
    action :add
    uri 'http://security.ubuntu.com'
    distribution "precise-security"
    components ['main', 'universe', "multiverse"]
end

apt_repository "chef-0.10" do
    uri ' http://apt.opscode.com precise-0.10'
    components ['main']
    key 'http://apt.opscode.com/packages@opscode.com.gpg.key'
end
=end

(node['base']['packages'] + node['base']['extra-packages']).uniq.each do |pkg|
    package pkg
end

chef_gem "pony"

Chef::Config.exception_handlers = [Express42::MailHandler.new('chef@project.ru', ['admin@project.ru'])]
