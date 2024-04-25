 Terraform Test Assessment
Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. It is heavily used in the Global Data Platform, we use it to configure our Azure and AWS infrastructure.

## Prerequisites
***You can look at [homebrew](https://brew.sh) for the installation of some of following tools***

You need to have terraform install on your machine `brew install terraform`

## Test 1: Create a terraform module for Self signed certificates
In the Global Data Platform, we use self signed certificates for certain use-cases.

You need to provide a modules that creates a self signed certificate.

**Requirements:**
- You must use maps for the variable `server_certificates` and output `server_certificates`
- You must lock the terraform provider version that will be used to generate the certificates
- You must defined a minimal terraform version to run the code

The module you are creating should respect the following inputs and outputs. It is also important to code with best practices that will be tested according to the documentation generated by `terraform-docs`.

**Input:**
```hlc
module "self_signed_certs" {
  source = "./modules/self_signed_certs"

  certificate_authority = {
    common_name = "site.contoso"
    country = "DE"
    locality = "Munich"
    organization = "contoso"
    unit = "site"
    validity = 87600 # 10 years
  }

  server_certificates ={
    server-1 = {
      common_name = "server1.site.contoso"
      country = "DE"
      locality = "Munich"
      organization = "contoso"
      unit = "site"
      validity = 8760 #1 year
    }

    server-2 = {
      common_name = "server2.site.contoso"
    }
  }
}
```

**Expected output:**
```hlc
certificate_authority_private_key = ...
certificate_authority_certificate = ...
server_certificates = {
  "server-1" = {
    "certificate" = ...
    "csr" = ...
    "private_key" = ...
  },
  "server-2" = {
    "certificate" = ...
    "csr" = ...
    "private_key" = ...
  }
}
```

**Expected documentation:**

--------------------------------------------------------------------------------
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.1 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.1.0 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.1.0 |

#### Modules

No modules.

#### Resources

| Name | Type |
|------|------|
| REMOVED FROM THE DOC | resource |


#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_authority"></a> [certificate\_authority](#input\_certificate\_authority) | Certificate authority | <pre>object({<br>    common_name  = string<br>    country      = string<br>    locality     = string<br>    organization = string<br>    unit         = string<br>    validity     = number<br>  })</pre> | n/a | yes |
| <a name="input_server_certificates"></a> [server\_certificates](#input\_server\_certificates) | Server certificates | `map(any)` | n/a | yes |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_authority_certificate"></a> [certificate\_authority\_certificate](#output\_certificate\_authority\_certificate) | Certificate authority certificate |
| <a name="output_certificate_authority_private_key"></a> [certificate\_authority\_private\_key](#output\_certificate\_authority\_private\_key) | Certificate authority private key |
| <a name="output_server_certificates"></a> [server\_certificates](#output\_server\_certificates) | Map of server certificates with private\_key, certificate, csr |



--------------------------------------------------------------------------------

## Test 2: Terrafom module that ouput your Internet provider infromation
This module is design to make you look on the different solutions available in terraform to get data form external sources.

in order to facilitate the test, we are using the following website to get Internet provider information:
```bash
$ curl http://ifconfig.co/json
{
  "ip": "20.61.XXXX.XXX",
  "ip_decimal": 339575341,
  "country": "Netherlands",
  "country_iso": "NL",
  "country_eu": true,
  "region_name": "North Holland",
  "region_code": "NH",
  "zip_code": "1012",
  "city": "Amsterdam",
  "latitude": 52.3759,
  "longitude": 4.8975,
  "time_zone": "Europe/Amsterdam",
  "asn": "AS8075",
  "asn_org": "MICROSOFT-CORP-MSN-AS-BLOCK",
  "user_agent": {
    "product": "curl",
    "version": "7.77.0",
    "raw_value": "curl/7.77.0"
  }
}
```

**Requirements:**
- The module should output the IP, 
- the country 
- and the asn


**Expected Output:**
```hlc
internet_provider_info = {
  "asn" = "AS8075"
  "country" = "Netherlands"
  "ip" = "20.61.XXX.XXX"
}
```


**Expected Documentation:**
-------------------------------------------
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.1 |

#### Providers

| Name | Version |
|------|---------|
| SOME SECRET PROVIDER| x.x.x |

#### Modules

No modules.

#### Resources

| Name | Type |
|------|------|
| [external_external.ip_info](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

#### Inputs

No inputs.

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_internet_provider_info"></a> [internet\_provider\_info](#output\_internet\_provider\_info) | The internet provider info |
-------------------------------------