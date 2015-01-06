#
# Cookbook Name:: google-auth-proxy
# Recipe:: default
#

# Install default instance
google_auth_proxy_instance 'default' do
  client_id 'example.com'
  client_secret 'clientkjsdfslkdjfdslkdfns'
  cookie_domain 'example.com'
  upstreams ['http://localhost:3000']
  google_apps_domains ['example.com']
end
