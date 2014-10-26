#
# Cookbook Name:: radiobot
# Recipe:: default
#
# Copyright 2014, ShoutIRC.com
#

#Check if this platform is supported
if node['radiobot']['install'][node[:platform_family]].nil?
	Chef::Log.error "A radiobot install options does not exist for '#{node['platform_family']}'. This means the radiobot cookbook does not have support for the	#{node['platform_family']} family."
end

#Get the install options for this platform
install_options = node['radiobot']['install'][node[:platform_family]]

#Check if overrides exist for distro specific install options
if node['radiobot']['install'][node[:platform_family]]['override'] && node['radiobot']['install'][node[:platform_family]]['override'][node[:platform]]
	install_options = node['radiobot']['install'][node[:platform_family]]['override'][node[:platform]]
end

#Check if this platform version is supported
if install_options['downloads'][node['platform_version']].nil?
	Chef::Log.error "A radiobot install options does exist for '#{node['platform_family']}' but not this version of your platform, #{node['platform_version']}."
end

#Install the packages required for this platform
install_options['packages'].split.each do |pkg|
	package pkg do
		action :install 
	end
end

#Add the RadioBot user
user "radiobot" do
  supports :manage_home => true
  comment "ShoutIRC RadioBot user"
  gid "users"
  home "/opt/radiobot"
  shell "/bin/bash"
end

#Download RadioBot for this platform
bash "install_radiobot" do
  user "root"
  cwd "/opt"
  code <<-EOH
	 mkdir -p radiobot
	 cd radiobot
	 wget -O radiobot.tar.gz "https://www.shoutirc.com/index.php?mod=Downloads&action=download&id=#{install_options['downloads'][node['platform_version']][node[:kernel][:machine]]}"
	 tar -xsvf radiobot.tar.gz
	 rm radiobot.tar.gz
	 chown radiobot ./ -R
  EOH
end unless File.exist?('/opt/radiobot/radiobot')

#Insert RadioBots config file based on user settings
template "/opt/radiobot/ircbot.conf" do
  source "ircbot.conf.erb"
  owner "radiobot"
  mode 0644
end

#TODO: Add support for IRCBot.text

#Install the RadioBot plugins so the AutoDJ can work
bash "install_radiobot" do
  user "radiobot"
  cwd "/opt/radiobot"
  code "./updater -a"
end

#Places the service init.d script into the platform
cookbook_file "radiobot_service" do
  path "/etc/init.d/radiobot"
  action :create_if_missing
  source "radiobot.init"
  group "root"
  owner "root"
  mode 0777
end

# Enable and start the RadioBot service
service "radiobot" do
  action [:enable, :start]
end