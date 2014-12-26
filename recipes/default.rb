#
# Cookbook Name:: openstack
# Recipe:: default
# Author:: Mohit Sethi (<mohit@sethis.in>)
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

if platform_family?('debian')
  node.override['apt']['compile_time_update'] = true
  include_recipe 'apt'
end

node.set['build-essential']['compile_time'] = true
include_recipe 'build-essential'

chef_gem 'nokogiri'

include_recipe 'xml::ruby'

chef_gem 'fog' do
  version node['openstack']['fog_version'] unless node['openstack']['fog_version']
  action :install
end

require 'fog'
