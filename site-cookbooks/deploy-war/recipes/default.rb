#
# Cookbook Name:: deploy-war

release_name = Time.now.utc.strftime("%Y%m%d%H%M%S")
release_dir  = "#{node[:deploy][:deploy_to]}/releases/" . release_name 

directory "release_dir" do
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



