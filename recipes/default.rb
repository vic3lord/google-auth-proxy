#
# Cookbook Name:: google-auth-proxy
# Recipe:: default
#

ark 'google-auth-proxy' do 
  url node['gap']['url']
  version node['gap']['version']
  has_binaries ['google_auth_proxy']
end

template_vars = {
  listen_addr: node['gap']['listen_addr'],
  listen_port: node['gap']['listen_port'],
  app_name: node['gap']['app_name'],
  upstreams: node['gap']['upstreams'],
  pass_basic_auth: node['gap']['pass_basic_auth'],
  google_apps_domains: node['gap']['google_apps_domains'],
  google_client_id: node['gap']['google_client_id'],
  google_client_secret: node['gap']['google_client_secret'],
  authenticated_emails_file: node['gap']['authenticated_emails_file'],
  cookie_secret: node['gap']['cookie_secret'],
  cookie_domain: node['gap']['cookie_domain'],
  cookie_expire: node['gap']['cookie_expire'],
  cookie_secure: node['gap']['cookie_secure']
}

template '/etc/google_auth_proxy.cfg' do
  source 'google_auth_proxy.cfg.erb'
  variables(template_vars)
  notifies :restart, 'service[google-auth-proxy]'
end

include_recipe 'google-auth-proxy::service'
