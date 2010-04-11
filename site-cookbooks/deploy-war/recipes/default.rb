#
# Cookbook Name:: deploy-war
releases_dir = "#{node[:deploy][:deploy_to]}/releases"
current_dir  = "#{node[:deploy][:deploy_to]}/current"

release_name = Time.now.utc.strftime("%Y%m%d%H%M%S")
release_dir  = releases_dir + "/" + release_name

webapp_home  = "/usr/share/tomcat6/webapps/#{node[:deploy][:context]}" 


directory release_dir do
  mode 0755
  owner "root"
  group "root"
  
  action :create
  recursive true
end

releases        = Dir.entries(releases_dir).sort
current_release = releases.last

remote_file "war" do
  path "/tmp/#{node[:deploy][:artifact]}"
  source "http://#{node[:deploy][:bucket]}.s3.amazonaws.com/ivy/#{node[:deploy][:org]}/#{node[:deploy][:module]}/#{node[:deploy][:revision]}/#{node[:deploy][:artifact]}"
end

bash "unjar-war" do
  user "root"
  cwd release_dir
  code <<-EOH
  jar xf /tmp/#{node[:deploy][:artifact]}
  EOH
end

link current_dir do
  to release_dir
end

link webapp_home do
  to current_dir
end

releases[2..-5].each do |release|
  directory release do
    recursive true
    action :delete
  end
end