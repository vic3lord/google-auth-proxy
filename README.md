# google-auth-proxy-cookbook

TODO: Enter the cookbook description here.

## Supported Platforms

TODO: List your supported platforms.

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
