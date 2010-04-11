#
# Cookbook Name:: deploy-war

remote_file "war" do
  path "/tmp/#{node[:deploy][:artifact]}"
  source "http://#{node[:deploy][:bucket]}.s3.amazonaws.com/ivy/#{node[:deploy][:org]}/#{node[:deploy][:module]}/#{node[:deploy][:revision]}/#{node[:deploy][:artifact]}"
end


