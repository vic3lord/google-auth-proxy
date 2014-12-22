# google-auth-proxy-cookbook

Chef cookbook to install [google\_auth\_proxy](https://github.com/bitly/google_auth_proxy) by bitly

## Supported Platforms

All Linux distros as it is written in go

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['google-auth-proxy']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

Create a role `google-auth-proxy` that looks like this

```
name 'google-auth-proxy'
description 'Reverse proxy to authenticate services'

default_attributes(
  'gap' => {
    'app_name' => 'gap.yourcompany.com',
    'upstreams' => {
      'http://upstream.yourcompany.com' => '80'
    },
    'google_apps_domains' => [
      'yourcompany.com'
    ],
    'google_client_id' => 'your google id'
    'google_client_secret' => 'your google secret'
  }
)

run_list %w(
  recipe[google-auth-proxy]
)
```

### google-auth-proxy::default

Include `google-auth-proxy` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[google-auth-proxy::default]"
  ]
}
```
