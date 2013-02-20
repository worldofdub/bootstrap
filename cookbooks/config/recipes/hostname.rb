#
# Cookbook Name:: config
# Recipe:: hostname
#
# Copyright 2011, Ben Bleything <ben@bleything.net>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

execute "scutil --set LocalHostName #{node.hostname}" do
  not_if do
    `scutil --get LocalHostName`.chomp == node.hostname
  end
end

execute "scutil --set HostName #{node.hostname}" do
  not_if do
    `scutil --get HostName`.chomp == node.hostname
  end
end

execute "networksetup -setcomputername #{node.hostname}" do
  not_if do
    `networksetup -getcomputername`.chomp == node.hostname
  end
end
