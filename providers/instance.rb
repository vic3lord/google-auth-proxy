require 'securerandom'

action :install do
  instance = new_resource.name
  download_url = new_resource.download_url || "https://github.com/bitly/google_auth_proxy/releases/download/v#{new_resource.version}/google_auth_proxy-#{new_resource.version}.linux-amd64.go1.3.tar.gz"

  if !new_resource.auth_users.nil?
    auth_emails_file = "/etc/google_auth_proxy/auth_emails_#{instance}"
  else
    auth_emails_file = ""
  end
  
  # Create cookie secret
  unless node.attribute? "google_auth.cookie_secret.#{instance}"
    node.set_unless['google_auth']['cookie_secret'][instance] = SecureRandom.base64 34
    node.save unless Chef::Config[:solo]
  end

  ark 'google_auth_proxy' do 
    url download_url
    version new_resource.version
    has_binaries ['google_auth_proxy']
  end

  directory '/etc/google_auth_proxy' do
    owner 'root'
    group 'root'
    mode '0755'
  end

  template "/etc/google_auth_proxy/#{instance}.conf" do
    source 'proxy.conf.erb'
    cookbook 'google-auth-proxy'
    mode '0640'
    owner new_resource.user
    group 'root'
    notifies :restart, "service[google-auth-proxy-#{instance}]"
    variables(
      client_id: new_resource.client_id,
      client_secret: new_resource.client_secret,
      cookie_domain: new_resource.cookie_domain,
      cookie_secret: node['google_auth']['cookie_secret'][instance],
      cookie_expire: new_resource.cookie_expire,
      cookie_https_only: new_resource.cookie_https_only,
      google_apps_domains: new_resource.google_apps_domains,
      listen_address: new_resource.listen_address,
      redirect_url: new_resource.redirect_url,
      upstreams: new_resource.upstreams,
      auth_emails_file: auth_emails_file,
      pass_basic_auth: new_resource.pass_basic_auth
    )
  end

  template "/etc/google_auth_proxy/auth_emails_#{instance}" do
    source 'auth_emails.erb'
    cookbook 'google-auth-proxy'
    mode '0640'
    owner new_resource.user
    variables(auth_users: new_resource.auth_users)
    not_if { new_resource.auth_users.nil? }
  end

  template "/etc/init.d/google-auth-proxy-#{instance}" do
    source 'init_script.erb'
    owner 'root'
    group 'root'
    mode '0755'
    variables(config: "#{instance}.conf")
  end

  service "google-auth-proxy-#{instance}" do
    action [:start, :enable]
  end
end

action :remove do
end
