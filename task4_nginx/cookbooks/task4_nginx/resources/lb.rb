resource_name :lb
property :role, kind_of: String, required: true

action :attach do 
  #puts node['fqdn']
  if node['fqdn'] == new_resource.role
    puts node['network']['interfaces']['enp0s8']['routes'][0]["src"]
      #file '/etc/motd' do
      #content "#{message}\n"
      #mode '0644'
      #end
  end
  #node.each do |n|
  #  puts "#{n[0]['roles']}"
  #end
end

action :detach do
  
end

    #bash 'knife_search' do
    #  code <<-EOH
    #  knife search node 'roles:*' -Fjson
    #  EOH
    #end