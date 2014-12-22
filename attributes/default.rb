default['gap']['version'] = '1.0'
default['gap']['url'] = 'https://github.com/bitly/google_auth_proxy/releases/download/v1.0/google_auth_proxy-1.0.linux-amd64.go1.3.tar.gz'

default['gap']['listen_addr'] = '127.0.0.1'
default['gap']['listen_port'] = '4180'

# application name
default['gap']['app_name'] = node['fqdn']

# upstreams
default['gap']['upstreams'] = [
  "localhost" => "8080"
]

default['gap']['google_apps_domains'] = [
  "yourdomain.com"
]

default['gap']['google_client_id'] = 'googleclientid'
default['gap']['google_client_secret'] = 'goooooooglesecret'

default['gap']['authenticated_emails_file'] = ""
