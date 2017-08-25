resource_name :lb
property :role, kind_of: String, required: true

action :attach do 
  search(:node, "role:#{new_resource.role}").each do |node|
    ruby_block "ensure node ip address in nginx.conf" do
    ip = "#{node['network']['interfaces']['enp0s8']['routes'][0]['src']}"
    block do
      file_editor = Chef::Util::FileEdit.new("/etc/nginx/conf.d/upstreams.conf")
      file_editor.insert_line_if_no_match(/server #{ip};/,"server #{ip};")
      file_editor.write_file       
        service "nginx" do    
          action :restart  
        end
      only_if { ::File.readlines("/etc/nginx/conf.d/upstreams.conf").grep(/server #{ip};/).size == 0 }
      end
    end
  end
end

action :detach do
    search(:node, "role:#{new_resource.role}").each do |node|
    ruby_block "ensure node ip address in nginx.conf" do
    ip = "#{node['network']['interfaces']['enp0s8']['routes'][0]['src']}"
    block do
      file_editor = Chef::Util::FileEdit.new("/etc/nginx/conf.d/upstreams.conf")
      file_editor.search_file_delete_line(/server #{ip};/)
      file_editor.write_file       
        service "nginx" do    
          action :restart  
        end
      only_if { ::File.readlines("/etc/nginx/conf.d/upstreams.conf").grep(/server #{ip};/).size > 0 }
      end
    end
  end
end