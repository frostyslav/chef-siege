#
# Cookbook Name:: siege
# Recipe:: source
# Author:: Rostyslav Fridman (<rostyslav.fridman@gmail.com>)
#
# Copyright 2014, Rostyslav Fridman
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

version = node[:siege][:version]
install_path = "#{node[:siege][:exec_prefix_dir]}/bin/siege"

remote_file "#{Chef::Config[:file_cache_path]}/siege-#{version}.tar.gz" do
  source "#{node[:siege][:url]}/siege-#{version}.tar.gz"
  checksum node[:siege][:checksum]
  mode 00644
end

configure_options = node[:siege][:configure_options].join(" ")
siege_install = false

if File.exists?(install_path)
  cmd = Mixlib::ShellOut.new(node[:version_check][:command])
  cmd.run_command
  matches = cmd.stdout.downcase.squeeze(' ').match(/version\s?: ([0-9\.]+)/)
  current_version = matches[1]
  if Gem::Version.new(version) > Gem::Version.new(current_version)
    siege_install = true
  end
else
  siege_install = true
end

bash "build-and-install-siege" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
  tar zxvf siege-#{version}.tar.gz
  (cd siege-#{version} && ./configure #{configure_options})
  (cd siege-#{version} && make && checkinstall #{node[:checkinstall][:options]})
  EOF
  not_if { siege_install == false }
end
