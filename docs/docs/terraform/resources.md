## Self-signed cert

[Self-signed-cert](https://dev.to/deathroll/trusted-self-signed-tls-certificates-for-dummies-w-thorough-explanations-included-da7)

To create a certificate, we need several other things first:

- A pair of keys for the Certificate Authority
- A self-signed CA certificate
- A pair of keys for the target resource
- A Certificate Signing Request (CSR) for the resource

CSR is a message for the CA, signed by an entity's private key. It contains info such as an email, an organization's full name, a country code, a city, a key type and its length, etc. An entity sends this message to a CA with the intent to have it signed by the CA's private key.

## TF module and resources docs

- [Modules](https://developer.hashicorp.com/terraform/tutorials/modules)
- [Tls provider](https://registry.terraform.io/providers/hashicorp/tls/latest/docs)
- [Map Varibles](https://spacelift.io/blog/terraform-map-variable)

The example below shows a map of type ‘object’. Values are complex objects with multiple attributes represented by key-value pairs.

```hcl
variable "example_map" {
  type = map(object({
    name = string
    enemies_destroyed = number
    badguy = bool
  }))
  default = {
    key1 = {
      name = "luke"
      enemies_destroyed = 4252
      badguy = false
    }
    key2 = {
      name = "yoda"
      enemies_destroyed = 900
      badguy = false
    }
    key3 = {
      name = "darth"
      enemies_destroyed=  20000056894
      badguy = true
    }
  }
}
```
