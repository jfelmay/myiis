#
# Cookbook:: myiis
# Recipe:: miserver
#
# Copyright:: 2019, The Authors, All Rights Reserved.
powershell_script "Install IIS" do
  code "Add-WindowsFeature Web-Server"
end

template 'C:\inetpub\wwwroot\Default.htm' do
  source "Default.htm.erb"
end

service "w3svc" do
  action [:enable, :start]
end
