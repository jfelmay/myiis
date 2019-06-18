#
# Cookbook:: myiis
# Recipe:: miserver
#
# Copyright:: 2019, The Authors, All Rights Reserved.
powershell_script "Install IIS" do
  code "Add-WindowsFeature Web-Server"
end

file 'C:\inetpub\wwwroot\Default.htm' do
  content "<h1>Hello, world!</h1>"
          "<h2>PLATFORM: #{node["plataform"]}</h2>"
          "<h3>HOSTNAME: #{node["hostname"]}</h3>"
          "<h4>MEMORY: #{node["memory"]["total"]}</h4>"
          "<h5>CPU Mhz: #{node["cpu"]["0"][mhz]}</h4>"
end

service "w3svc" do
  action [:enable, :start]
end
