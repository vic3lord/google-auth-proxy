actions :install, :remove
default_action :install

attribute :client_id, kind_of: String
attribute :client_secret, kind_of: String
attribute :cookie_domain, kind_of: String
attribute :cookie_secret, kind_of: String
attribute :cookie_expire, kind_of: String, default: '168h'
attribute :cookie_https_only, kind_of: [TrueClass, FalseClass], default: true

attribute :user, kind_of: String, default: 'www-data'
attribute :listen_address, kind_of: String, default: '127.0.0.1:4180'

attribute :google_apps_domains, kind_of: Array
attribute :redirect_url, kind_of: String
attribute :upstreams, kind_of: Array, default: '127.0.0.1:4181'

attribute :auth_users, kind_of: Array
attribute :download_url, kind_of: String
attribute :version, kind_of: String, default: '1.0'
attribute :pass_basic_auth, kind_of: [TrueClass, FalseClass], default: false
