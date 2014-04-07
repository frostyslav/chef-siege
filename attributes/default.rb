#
# Cookbook Name:: siege
# Attributes:: default
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

default[:siege][:install_method] = "source"

# Used for source installation
default[:siege][:url] = "http://www.joedog.org/pub/siege"
default[:siege][:version] = "3.0.6"
default[:siege][:checksum] = "78b79964e3d6772e532c6008a084700f830a02a00ca80b44f3e71380b4908c5b"

default[:siege][:prefix_dir] = "/"
default[:siege][:exec_prefix_dir] = "/usr"
default[:siege][:config_dir] = "/etc/siege"
default[:siege][:doc_dir] = "/usr/share"
default[:siege][:include_dir] = "/usr/include"
default[:siege][:info_dir] = "/usr/share/info"
default[:siege][:man_dir] = "/usr/share/man"
default[:siege][:configure_options] = %w{
--prefix=#{siege[:prefix_dir]}
--exec-prefix=#{siege[:exec_prefix_dir]}
--sysconfdir=#{siege[:config_dir]}
--datarootdir=#{siege[:doc_dir]}
--includedir=#{siege[:include_dir]}
--infodir=#{siege[:info_dir]}
--mandir=#{siege[:man_dir]}
}
