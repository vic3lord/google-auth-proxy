cookbook_file '/etc/init.d/google-auth-proxy' do
  source 'gap_init_d'
  owner 'root'
  group 'root'
  mode '0755'
end

service 'google-auth-proxy' do
  action :start
end
