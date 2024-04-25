## Self-signed cert

[Self-signed-cert](https://dev.to/deathroll/trusted-self-signed-tls-certificates-for-dummies-w-thorough-explanations-included-da7)

To create a certificate, we need several other things first:

- A pair of keys for the Certificate Authority
- A self-signed CA certificate
- A pair of keys for the target resource
- A Certificate Signing Request (CSR) for the resource

CSR is a message for the CA, signed by an entity's private key. It contains info such as an email, an organization's full name, a country code, a city, a key type and its length, etc. An entity sends this message to a CA with the intent to have it signed by the CA's private key.

[CSR](https://www.ssldragon.com/blog/certificate-signing-request-csr/)

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
Terraforms for_each loop iterates over a map or set of strings, creating one resource per item.

- [for_each](https://www.slingacademy.com/article/ways-to-use-loops-in-terraform-with-examples/)

```hcl
variable "instance_details" {
  type = map(object({
    ami           = string
    instance_type = string
  }))
}

resource "aws_instance" "example" {
  for_each = var.instance_details

  ami           = each.value.ami
  instance_type = each.value.instance_type
  tags = {
    Name = "Instance-${each.key}"
  }
}
```

- [for looop](https://developer.hashicorp.com/terraform/language/expressions/for)
- [Sensitive data output](https://support.hashicorp.com/hc/en-us/articles/5175257151891-How-to-output-sensitive-data-with-Terraform)
