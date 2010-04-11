#
# Cookbook Name:: deploy-war

directory "#{node[:deploy][:deploy_to]}/releases" do
  mode 0755
  owner "root"
  group "root"
  
  action :create
  recursive true
end

remote_file "war" do
  path "/tmp/#{node[:deploy][:artifact]}"
  source "http://#{node[:deploy][:bucket]}.s3.amazonaws.com/ivy/#{node[:deploy][:org]}/#{node[:deploy][:module]}/#{node[:deploy][:revision]}/#{node[:deploy][:artifact]}"
end



