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

### google-auth-proxy::default

Include `google-auth-proxy` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[google-auth-proxy::default]"
  ]
}
```
