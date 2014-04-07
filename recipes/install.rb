#
# Cookbook Name:: siege
# Recipe:: install
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

case node[:platform]
  when "debian", "ubuntu"
    node.default[:checkinstall][:options] = "-y"
    node.default[:version_check][:command] = "dpkg -s siege"
    %w{g++ checkinstall}.each do |pkg|
      package pkg do
        action :install
      end
    end
  when "redhat", "centos", "amazon", "scientific"
    node.default[:checkinstall][:options] = "-R -y --install=yes"
    node.default[:version_check][:command] = "rpm -qi siege"
    %w{gcc-c++ checkinstall}.each do |pkg|
      package pkg do
        action :install
      end
end

include_recipe "siege::#{node[:siege][:install_method]}"
