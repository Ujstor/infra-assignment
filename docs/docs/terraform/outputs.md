```bash
 terraform init

Initializing the backend...
Initializing modules...
- self_signed_certs in modules/self_signed_certs

Initializing provider plugins...
- Finding hashicorp/tls versions matching "4.0.5"...
- Installing hashicorp/tls v4.0.5...
- Installed hashicorp/tls v4.0.5 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

```bash
 terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.self_signed_certs.tls_cert_request.server["server-1"] will be created
  + resource "tls_cert_request" "server" {
      + cert_request_pem = (known after apply)
      + id               = (known after apply)
      + key_algorithm    = (known after apply)
      + private_key_pem  = (sensitive value)

      + subject {
          + common_name         = "server1.site.contoso"
          + country             = "DE"
          + locality            = "Munich"
          + organization        = "contoso"
          + organizational_unit = "site"
        }
    }

  # module.self_signed_certs.tls_cert_request.server["server-2"] will be created
  + resource "tls_cert_request" "server" {
      + cert_request_pem = (known after apply)
      + id               = (known after apply)
      + key_algorithm    = (known after apply)
      + private_key_pem  = (sensitive value)

      + subject {
          + common_name         = "server2.site.contoso"
          + country             = "DE"
          + locality            = "Munich"
          + organization        = "contoso"
          + organizational_unit = "site"
        }
    }

  # module.self_signed_certs.tls_locally_signed_cert.server["server-1"] will be created
  + resource "tls_locally_signed_cert" "server" {
      + allowed_uses          = [
          + "server_auth",
        ]
      + ca_cert_pem           = (known after apply)
      + ca_key_algorithm      = (known after apply)
      + ca_private_key_pem    = (sensitive value)
      + cert_pem              = (known after apply)
      + cert_request_pem      = (known after apply)
      + early_renewal_hours   = 0
      + id                    = (known after apply)
      + is_ca_certificate     = false
      + ready_for_renewal     = false
      + set_subject_key_id    = false
      + validity_end_time     = (known after apply)
      + validity_period_hours = 8760
      + validity_start_time   = (known after apply)
    }

  # module.self_signed_certs.tls_locally_signed_cert.server["server-2"] will be created
  + resource "tls_locally_signed_cert" "server" {
      + allowed_uses          = [
          + "server_auth",
        ]
      + ca_cert_pem           = (known after apply)
      + ca_key_algorithm      = (known after apply)
      + ca_private_key_pem    = (sensitive value)
      + cert_pem              = (known after apply)
      + cert_request_pem      = (known after apply)
      + early_renewal_hours   = 0
      + id                    = (known after apply)
      + is_ca_certificate     = false
      + ready_for_renewal     = false
      + set_subject_key_id    = false
      + validity_end_time     = (known after apply)
      + validity_period_hours = 8760
      + validity_start_time   = (known after apply)
    }

  # module.self_signed_certs.tls_private_key.ca will be created
  + resource "tls_private_key" "ca" {
      + algorithm                     = "RSA"
      + ecdsa_curve                   = "P224"
      + id                            = (known after apply)
      + private_key_openssh           = (sensitive value)
      + private_key_pem               = (sensitive value)
      + private_key_pem_pkcs8         = (sensitive value)
      + public_key_fingerprint_md5    = (known after apply)
      + public_key_fingerprint_sha256 = (known after apply)
      + public_key_openssh            = (known after apply)
      + public_key_pem                = (known after apply)
      + rsa_bits                      = 4096
    }

  # module.self_signed_certs.tls_private_key.server["server-1"] will be created
  + resource "tls_private_key" "server" {
      + algorithm                     = "RSA"
      + ecdsa_curve                   = "P224"
      + id                            = (known after apply)
      + private_key_openssh           = (sensitive value)
      + private_key_pem               = (sensitive value)
      + private_key_pem_pkcs8         = (sensitive value)
      + public_key_fingerprint_md5    = (known after apply)
      + public_key_fingerprint_sha256 = (known after apply)
      + public_key_openssh            = (known after apply)
      + public_key_pem                = (known after apply)
      + rsa_bits                      = 4096
    }

  # module.self_signed_certs.tls_private_key.server["server-2"] will be created
  + resource "tls_private_key" "server" {
      + algorithm                     = "RSA"
      + ecdsa_curve                   = "P224"
      + id                            = (known after apply)
      + private_key_openssh           = (sensitive value)
      + private_key_pem               = (sensitive value)
      + private_key_pem_pkcs8         = (sensitive value)
      + public_key_fingerprint_md5    = (known after apply)
      + public_key_fingerprint_sha256 = (known after apply)
      + public_key_openssh            = (known after apply)
      + public_key_pem                = (known after apply)
      + rsa_bits                      = 4096
    }

  # module.self_signed_certs.tls_self_signed_cert.ca will be created
  + resource "tls_self_signed_cert" "ca" {
      + allowed_uses          = [
          + "cert_signing",
        ]
      + cert_pem              = (known after apply)
      + early_renewal_hours   = 0
      + id                    = (known after apply)
      + is_ca_certificate     = false
      + key_algorithm         = (known after apply)
      + private_key_pem       = (sensitive value)
      + ready_for_renewal     = false
      + set_authority_key_id  = false
      + set_subject_key_id    = false
      + validity_end_time     = (known after apply)
      + validity_period_hours = 87600
      + validity_start_time   = (known after apply)

      + subject {
          + common_name         = "site.contoso"
          + country             = "DE"
          + locality            = "Munich"
          + organization        = "contoso"
          + organizational_unit = "site"
        }
    }

Plan: 8 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + certificate_authority_certificate = (known after apply)
  + certificate_authority_private_key = (known after apply)
  + server_certificates               = {
      + server-1 = {
          + certificate = (known after apply)
          + csr         = (known after apply)
          + private_key = (known after apply)
        }
      + server-2 = {
          + certificate = (known after apply)
          + csr         = (known after apply)
          + private_key = (known after apply)
        }
    }

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.self_signed_certs.tls_private_key.server["server-2"]: Creating...
module.self_signed_certs.tls_private_key.server["server-1"]: Creating...
module.self_signed_certs.tls_private_key.ca: Creating...
module.self_signed_certs.tls_private_key.server["server-2"]: Creation complete after 1s [id=2db007b0134666947a15bbe210e5c6c245eaf9ee]
module.self_signed_certs.tls_private_key.server["server-1"]: Creation complete after 2s [id=0f1b355d1119a4eab984de760c9d364acc9a0bff]
module.self_signed_certs.tls_cert_request.server["server-1"]: Creating...
module.self_signed_certs.tls_cert_request.server["server-2"]: Creating...
module.self_signed_certs.tls_cert_request.server["server-2"]: Creation complete after 0s [id=adafe3041f0c2feaf2ac902ca2f05029e9d1d5cc]
module.self_signed_certs.tls_cert_request.server["server-1"]: Creation complete after 0s [id=3a146f5682c1ced6781d68a15d6126c2648407f5]
module.self_signed_certs.tls_private_key.ca: Creation complete after 2s [id=b2019991cd525b90d9921e9e025c124c13730e35]
module.self_signed_certs.tls_self_signed_cert.ca: Creating...
module.self_signed_certs.tls_self_signed_cert.ca: Creation complete after 0s [id=136791563046151125238510274991162960516]
module.self_signed_certs.tls_locally_signed_cert.server["server-1"]: Creating...
module.self_signed_certs.tls_locally_signed_cert.server["server-2"]: Creating...
module.self_signed_certs.tls_locally_signed_cert.server["server-1"]: Creation complete after 0s [id=299979482866731651066759678550842740665]
module.self_signed_certs.tls_locally_signed_cert.server["server-2"]: Creation complete after 0s [id=93032659691980238896525632027655628966]
╷
│ Warning: Potentially Invalid Certificate Authority
│
│   with module.self_signed_certs.tls_locally_signed_cert.server["server-2"],
│   on modules/self_signed_certs/main.tf line 40, in resource "tls_locally_signed_cert" "server":
│   40: resource "tls_locally_signed_cert" "server" {
│
│ Certificate provided as Authority does not appear to be a valid Certificate Authority. The resulting certificate might fail certificate validation.
│
│ (and one more similar warning elsewhere)
╵

Apply complete! Resources: 8 added, 0 changed, 0 destroyed.

Outputs:

certificate_authority_certificate = <<EOT
-----BEGIN CERTIFICATE-----
MIIFVjCCAz6gAwIBAgIQZukYxATZZF7groK2XCCqhDANBgkqhkiG9w0BAQsFADBW
MQswCQYDVQQGEwJERTEPMA0GA1UEBxMGTXVuaWNoMRAwDgYDVQQKEwdjb250b3Nv
MQ0wCwYDVQQLEwRzaXRlMRUwEwYDVQQDEwxzaXRlLmNvbnRvc28wHhcNMjQwNDI1
MjE0NzM4WhcNMzQwNDIzMjE0NzM4WjBWMQswCQYDVQQGEwJERTEPMA0GA1UEBxMG
TXVuaWNoMRAwDgYDVQQKEwdjb250b3NvMQ0wCwYDVQQLEwRzaXRlMRUwEwYDVQQD
EwxzaXRlLmNvbnRvc28wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCv
l7ddJeRFzbhty3GdcxEbiD/sMp6XCnfYXHPee/CG4UQAwQjdk7VjEZITXSC88Mlx
MnmQ+HUxoprMuUDXSZk5Y2KvgFK2FOfk6Ex62gtMIBB56Tc2PGKSCTJOqoM7lD2F
vr3r9SS5qujX/bSa9A7ftFQi4DwiyvQH0ZjSFKHjzN3QrYkJp/Jp/fK9GQi45DfK
DtPgTSHou9wCivGBoXSU+MOTefTa1L3KbOxjA2QTh+Zndaw86d1aQsVI2pJv8Bja
xmMvjkB0rgY8T/HjsJkmXUzmgi5Ht/HtWImwWrJ7OwsL3vUmkgb6Ss/qIjSB3jsI
oVsc43DkCB2pxo8TQetmHiWk67hd9xhJGrkcOoLAvVlueBXb9QKHelotHgaKJzg/
mfPyIiM4zZnQWRbiIDZWMnlF5yB2wktghHRqgGMNCQmrgXFfOb27GMIb8M2U8WB9
ED3yD9Ja4Br64mTKrcdQjnGkOAoLxTFWQqCCVQPMnBgGibZecpHnM+FZP0kc/Qn2
bDCAjQoG2zaR+TP5dL766Hm+Te8jpckspBUOgzA20hz4auBx6LEy9q7jEjctFHQ8
tnKiKZfJnURH0RG3P7hI+TiwUAt1YdQwxWmSnhln6iXIAwPv8SjNn5UKcQib4t/M
iO6jxYfk2hXdteAiMPPYubcWB5WoOFm1fjoFfwcWJwIDAQABoyAwHjAOBgNVHQ8B
Af8EBAMCAgQwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQsFAAOCAgEAOGi5rm4O
UwurAA4VaRnHojlLQofvnGo5ycJicYL56LQoNgcnDWIICGMqm2NnSworJDfc0kUK
S21BowMxtY0WOroMwDDCDS8Ed9g/hZPCYjjG2VoCCNlBPRPPCPVLnEFi31BKJPKi
AJAzcYjujldYWCpyUEDg+xZeamMRhX7guL5skRwWhQ7+NlpKbqnX//KijCVq+hhI
eYAHW9mxUwho1mWTPqLvTXz4kGblf1N3vE4EUTcUCIDUp8HaIExARWewYSdu1G65
5FrK3i9n63Jm1LXCE2vLKcFQqn6BK/ce1de25BCmOTDZOXkBOqp4AdjdGDnfZh2o
nc4OwQPQk81PVinTE1R2O10SAMP1zGfDSEiE+zSZXS7Ie+UtHQSrDnrCdQ1eJU94
ELiaDD8kVF3cT7AJoQTAop9RSTv6l3llbUPNOMYaTYTHhNBz9d8MPA7M7eHmzKrC
ZfeBswsn476tC2IWH7c5yrmiVxDrOhEc//Y3CNwNuamVWcUrYUR9YdBEuu1Mzm2b
9EgHi8tKCLveXoQfPqzQn7gojOMtqoGW00yMb+bXxRx9h/A5lyZcGo+ZBIO+cBU1
WaXoflZmc+yqBYcwMMnzP9Q+fquoLVhAO1L5fKWEv+nexH+zN52ViFz4H23JEux5
H2Pj6qewTMAyRRiTU3tAbD2ntQzDZ0pGKLk=
-----END CERTIFICATE-----

EOT
certificate_authority_private_key = <<EOT
-----BEGIN RSA PRIVATE KEY-----
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
-----END RSA PRIVATE KEY-----

EOT
server_certificates = {
  "server-1" = {
    "certificate" = <<-EOT
    -----BEGIN CERTIFICATE-----
    MIIFZDCCA0ygAwIBAgIRAOGt8mZug463ihXGqkofD7kwDQYJKoZIhvcNAQELBQAw
    VjELMAkGA1UEBhMCREUxDzANBgNVBAcTBk11bmljaDEQMA4GA1UEChMHY29udG9z
    bzENMAsGA1UECxMEc2l0ZTEVMBMGA1UEAxMMc2l0ZS5jb250b3NvMB4XDTI0MDQy
    NTIxNDczOFoXDTI1MDQyNTIxNDczOFowXjELMAkGA1UEBhMCREUxDzANBgNVBAcT
    Bk11bmljaDEQMA4GA1UEChMHY29udG9zbzENMAsGA1UECxMEc2l0ZTEdMBsGA1UE
    AxMUc2VydmVyMS5zaXRlLmNvbnRvc28wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAw
    ggIKAoICAQDQ2euk42hMR8BYwTqgt7HUfhuo0uWXv76A0Z1JngDFmGvYGMtduuoc
    c5pRZD3HiX4sa05vWKMw3q263Bklb8MOq0imGxrbSdq84+VaT9huhJ/9FBY/3HoK
    oRxbGMSm4EW0U6L4ltyAi6L4Np+58wk9m++RGjXWnFlsFpJP0guCKwI1LF1MoSPL
    9W7pkHaAthU7NpXjzKkZf66urzymkUkaHRIvRBrEKxPkBiYpjJ55hhFjTwB/HRqe
    Mje7LZXMY944vMhzHyGLR8t+F3Pc2dsRulNSGutf2YrMtgvpmqqbVyYWCdtbAl6b
    RDmB5w5M5Dn6Vf+xHdtLu2XauDlmdwrkig4xu0Fpw1N0+Fg8a3vgnSoR9eQ52N2p
    Ue2p7jBY7Lnepzm8GcmycYlMlZ86hxy5eqSsdYlAuN3vi159MaofkSeWJyVlfK6u
    PCCHSeoU/fM0ZAgt0O5fTwI+Oz6sN6gBkNrsKvAxRrYW5cxcFhvMX6vaW3GCXadL
    aLH3KADMcnVZZ7kr/PzPLTr90DJ4HFB0fC1CZCmvrajbK11YFYcWl0MzUwHb9MFg
    dL+qI676QB6qMODzgG41mAYBIkOollbgZQGEtsb/uA1QQErNCGdDXRH+ufEHS7HO
    66h0f4xcsbmNSvoWKzQ5wjrrvpT2Kx6e5f6ZxDH+Ths1HKXbyLjBbQIDAQABoyUw
    IzATBgNVHSUEDDAKBggrBgEFBQcDATAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEB
    CwUAA4ICAQCsHHVLzxo1SXVo60NGOpIGaTLeL7ej7/uHWvTQbldnbKxIVwSZrkCl
    Zn9lvtOu0UEdsbHY7BIgV3i50FhGItf+zMNrohgai6awMorTFec8YTU4uIq1aefT
    zJc6ej5iRJlu5LI2vTvoCZhnAllbiBGeT9hjHs2v+/1LQ5q+pKVurDaToLSgbjX4
    jMbRapFKem7rAsAmJvt+DclRLYWgfrXewrMvKXdZsotsiZtm6exxRLhCMP7sWNs8
    mAlgsfpmWZvaQcM7xKgIP1e26S7fMW5mCdr0IWrQHi0FUJh7VHqsEWHd33MiMMJn
    kcNJOhiZrtjW67HIrr2cPdnp1uHroh5LqAFRqdXkxjmLH5jnhT4rfi7o2idsTTCz
    e9Vb3LMi7RlVGpxcdVmPVCXbfqkcRK0jSGZf6Dnst7g7YG8OzzzK9UCBS4zqVIbR
    D0litP4bQTz6KILYC6ZYMgSV3Gcbr2iscRuPIUqMvT2TKvzU6NCN7E7TxTjllS7f
    P04xVaLWzUTTDpuB1RHTOnW8tNE0DoH/kXyS8HMBtOTjE+7eRNx7tV+BjVbfp+C/
    Mv/dy4vB77HAHjCNF65wTteTmsDY5eN9uDA5Tm++9EKT6SVtkzdpA2mz8rH5Cjx5
    KE0pCiXAg+n3osFGKY/3XLDjKNvy+MaakASEbnZ9P6d4BSr7VcOorw==
    -----END CERTIFICATE-----

    EOT
    "csr" = <<-EOT
    -----BEGIN CERTIFICATE REQUEST-----
    MIIEozCCAosCAQAwXjELMAkGA1UEBhMCREUxDzANBgNVBAcTBk11bmljaDEQMA4G
    A1UEChMHY29udG9zbzENMAsGA1UECxMEc2l0ZTEdMBsGA1UEAxMUc2VydmVyMS5z
    aXRlLmNvbnRvc28wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDQ2euk
    42hMR8BYwTqgt7HUfhuo0uWXv76A0Z1JngDFmGvYGMtduuocc5pRZD3HiX4sa05v
    WKMw3q263Bklb8MOq0imGxrbSdq84+VaT9huhJ/9FBY/3HoKoRxbGMSm4EW0U6L4
    ltyAi6L4Np+58wk9m++RGjXWnFlsFpJP0guCKwI1LF1MoSPL9W7pkHaAthU7NpXj
    zKkZf66urzymkUkaHRIvRBrEKxPkBiYpjJ55hhFjTwB/HRqeMje7LZXMY944vMhz
    HyGLR8t+F3Pc2dsRulNSGutf2YrMtgvpmqqbVyYWCdtbAl6bRDmB5w5M5Dn6Vf+x
    HdtLu2XauDlmdwrkig4xu0Fpw1N0+Fg8a3vgnSoR9eQ52N2pUe2p7jBY7Lnepzm8
    GcmycYlMlZ86hxy5eqSsdYlAuN3vi159MaofkSeWJyVlfK6uPCCHSeoU/fM0ZAgt
    0O5fTwI+Oz6sN6gBkNrsKvAxRrYW5cxcFhvMX6vaW3GCXadLaLH3KADMcnVZZ7kr
    /PzPLTr90DJ4HFB0fC1CZCmvrajbK11YFYcWl0MzUwHb9MFgdL+qI676QB6qMODz
    gG41mAYBIkOollbgZQGEtsb/uA1QQErNCGdDXRH+ufEHS7HO66h0f4xcsbmNSvoW
    KzQ5wjrrvpT2Kx6e5f6ZxDH+Ths1HKXbyLjBbQIDAQABoAAwDQYJKoZIhvcNAQEL
    BQADggIBABnIp3X8mqEuY7pfPxXi9GV0u/m2/h90ujOxVufWutTjOWH2uUaiqCxE
    yV8KUla3TDoQNO9T/mKH6NW9j4f/Al7ZuAPCRU9PvZoJoP5syBPhARbH62mXYPRa
    JISd61a4WvVC8pinuk4xUAeAdncvSYj9vAgCrMDErJFQq2Y3HahOAG8357jodYKz
    wGy65fcDI9samS9p6l42gz5NkpdK9VOhyvRpdmZRCqmFDbxI0NLw1qFW2NWhnjMV
    1y1xQEguP1auW2xpnYBZjEZYncmq8pustX539yOOTvlr7Js5YyK3l4MkqMP+8f9i
    fFaUoDW8ebKgl/dfBMx47k74BbuFQoUgvJMANNt7fYMAqlYd9vQbdQ/DPu4aI4Cy
    /ieg0gIYOffLbmSA1CEiI/gm04KoLWwQK92K+uEbP9ewTU3zMyezhcVYgX1bHYoP
    JGMWm79tFMeZ30UoEcS9lufK1GSS203mckiT97430sb9CoivD6QUG4u8gYQpdyjq
    8738clrDW1S/JcWQXErkMIGooiJdVbQ0QicowTEF9eWQxyEgVr4EeWXGb0i5doc5
    +t1tq4VskUzCVBqA7Ug7+McuwmNMSlrkxHAk5iAjffFRyAA8+Mq8WVzPLrFNDvRq
    1RpMTPmoh/cZP373zOYfS9QCFi1Oxe228TC1qM8VlM+R/xmZtLSS
    -----END CERTIFICATE REQUEST-----

    EOT
    "private_key" = <<-EOT
    -----BEGIN RSA PRIVATE KEY-----
    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
    -----END RSA PRIVATE KEY-----

    EOT
  }
  "server-2" = {
    "certificate" = <<-EOT
    -----BEGIN CERTIFICATE-----
    MIIFYzCCA0ugAwIBAgIQRf1wQjxZlLsIYaxvdbtopjANBgkqhkiG9w0BAQsFADBW
    MQswCQYDVQQGEwJERTEPMA0GA1UEBxMGTXVuaWNoMRAwDgYDVQQKEwdjb250b3Nv
    MQ0wCwYDVQQLEwRzaXRlMRUwEwYDVQQDEwxzaXRlLmNvbnRvc28wHhcNMjQwNDI1
    MjE0NzM4WhcNMjUwNDI1MjE0NzM4WjBeMQswCQYDVQQGEwJERTEPMA0GA1UEBxMG
    TXVuaWNoMRAwDgYDVQQKEwdjb250b3NvMQ0wCwYDVQQLEwRzaXRlMR0wGwYDVQQD
    ExRzZXJ2ZXIyLnNpdGUuY29udG9zbzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCC
    AgoCggIBALTZ9o8B7zxO3TjEd3A+cKBI/EMloLmjXEYIPBctKkWVNe/hoREqiDiw
    a04u0eCbyJeY3jWEcA5/6KXelzEjhavkwN+kcwK9ZiVHaZzinDBUq1CkqhrqxcFF
    Go/AgtrK0bRaioctuiVQbXhFVg3bwh35zCFF3UFZ+8P8Ytmo0lEOQMC/sbb0nfoD
    T7q7wK8SPJgZuFmEV0BSlUMAxPoN9boS5j20gQUBSBE4vmSOK80uyN7xjBoM/wzP
    8A8GEi55C+uE/Z2aR6t2FWGVTdgFQD907w+9rkMPufwP3zzFYirlP9FSGcca2eK0
    kK518jcx7vwLZ35vBpzgNh9t6iRQL/oV/60VhT4zkrwwYBoTVYsXL7YRbgF77wLF
    MimiJ/siQ+ap/okB/6wUjtGBPpKseHKM7J8UBpsNgtWzQkUQRs4THmBG8WdGZiBz
    /Tl0xCKvxKzM5pHU7PstEMCPhCHv9GSaAV1W0lKVEgTG0H0p4P4EKvy4Q2F+nCsZ
    gwWv+FvtezhtQnejDN0dPiydyfZ4kPBs0++WkX+AUmYrPDgK/CvGSEug15ia5mZb
    88bKBotwEYMwAdGtP6NfoIUvs2YZFsCvSYRq/QrgARTPatsWw9rSKKLwjhBxVaAD
    JKIkXvL25/nvm/pIy0TP1ganylAyn0rYriSxTfO5NDFgR/HQPhM7AgMBAAGjJTAj
    MBMGA1UdJQQMMAoGCCsGAQUFBwMBMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEL
    BQADggIBADyaCL2eBKw5V4v4AwUkO2lKbaF/snvL3VXQv1lEkFt7y5354Y+O14Ha
    ByyxLPMsOeA+E1eUHHG/du+wuYZe1pr7ZeayLQMIlPUiSxBv9EcB5WWDpVna9545
    CqBYGPxKQU3oasVg0FGPvJnZnzb3MI8oo4fJyn+c8QeQxP5jgz/rxLem28F7LFr8
    neXGM0PaXXF+N6aD129qnEx+QYQLoaHAwKEar4p5DTKxcN9Gu2fBIdf0qcTP1MMN
    W+7KxofNwQg0TAcygzfLVxclER9wvg/maqPkTY/L+frIZ9OrUsa7F41wAESuQqgF
    aZTQwa+M2LYRRGlW+e6UqFyU21DL1i4BGlG7KJVj69KHXE7PxILw4IxanQW8Ze+t
    JdgU694FOXGH7vB0deXbN7OsJ00nA8DylIfXSCKE6bVEHZcJCzsmoj7LKtQcZlmn
    Nw/nwj8znUhRoljqVl3nLPBp2sl18Rl32Y8pmBZGQwsfCywjrkvQsBp6z3Sp27S2
    ILDzAAH2mvfc1eggCclcMlJrCshog75O31RXbcyS2xtF4UOjLlFTBPQta+UBm4Rl
    /h1E8zuChD5d1S0okReyEThiLXW740xv1o5lA7XKL1yTdUuc+GGcFCQm9T+WLMXT
    EXFcy0lvL5szZO4xs5zNHhrpmUsAvXJkLzThKwX3OB2bpQQiv2L/
    -----END CERTIFICATE-----

    EOT
    "csr" = <<-EOT
    -----BEGIN CERTIFICATE REQUEST-----
    MIIEozCCAosCAQAwXjELMAkGA1UEBhMCREUxDzANBgNVBAcTBk11bmljaDEQMA4G
    A1UEChMHY29udG9zbzENMAsGA1UECxMEc2l0ZTEdMBsGA1UEAxMUc2VydmVyMi5z
    aXRlLmNvbnRvc28wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQC02faP
    Ae88Tt04xHdwPnCgSPxDJaC5o1xGCDwXLSpFlTXv4aERKog4sGtOLtHgm8iXmN41
    hHAOf+il3pcxI4Wr5MDfpHMCvWYlR2mc4pwwVKtQpKoa6sXBRRqPwILaytG0WoqH
    LbolUG14RVYN28Id+cwhRd1BWfvD/GLZqNJRDkDAv7G29J36A0+6u8CvEjyYGbhZ
    hFdAUpVDAMT6DfW6EuY9tIEFAUgROL5kjivNLsje8YwaDP8Mz/APBhIueQvrhP2d
    mkerdhVhlU3YBUA/dO8Pva5DD7n8D988xWIq5T/RUhnHGtnitJCudfI3Me78C2d+
    bwac4DYfbeokUC/6Ff+tFYU+M5K8MGAaE1WLFy+2EW4Be+8CxTIpoif7IkPmqf6J
    Af+sFI7RgT6SrHhyjOyfFAabDYLVs0JFEEbOEx5gRvFnRmYgc/05dMQir8SszOaR
    1Oz7LRDAj4Qh7/RkmgFdVtJSlRIExtB9KeD+BCr8uENhfpwrGYMFr/hb7Xs4bUJ3
    owzdHT4sncn2eJDwbNPvlpF/gFJmKzw4CvwrxkhLoNeYmuZmW/PGygaLcBGDMAHR
    rT+jX6CFL7NmGRbAr0mEav0K4AEUz2rbFsPa0iii8I4QcVWgAySiJF7y9uf575v6
    SMtEz9YGp8pQMp9K2K4ksU3zuTQxYEfx0D4TOwIDAQABoAAwDQYJKoZIhvcNAQEL
    BQADggIBAG/NexDt4wsn+ZvUVAdqasUD9Vrgx98f89AQqdeEOVL47rRHx87Fw6i2
    Yj7Id9TDcXFa4whGJcbsVcooE10KJw9Cl+hFcGqJLrv6LUd+k9GopPSTBPBET7y4
    R3FG6tP8tFO9Vr76+JzzGkAqui4TWfnurTz6QB9yQezq4Z+kws53W4lzC/M6Y2eM
    UA5DKx4Zw9RnyYccmkOsmj9CoIZgq781vnK0PA3fEITv1MO8aFavPr6yL6+04gFz
    qQnXuKwkBqI5uB0Au/HeWukv7kYIbd5CVUkk2RuYcF+xpITuj7V0hiFhBlxZ5lXk
    kvBE/MArhkNeQLJOcnVPOr7sg+5FZOXbgOdm5MAJNXYptJ5vuVv8pT2fzAs8FDcb
    TV69c2V305+QEF1pWBSo58/u7miURg1OaCGoU7Pe/CoCcahvBEG2h1Z2FU/Z78H0
    5TL0crDXSR8zuwa63sfWlfszETmqmIaDbX88POczKoW44mIJXr8mzDS48NZPwlza
    R7dL7U/SmsmjdT4c13UxihobF4G3akja9uGoRjWamOMrz0HiYp/ZccRVLL+fN9KS
    q4HsRLSSNZxk8T4TmDVB3xJNb2mLWKF6XHgJp/n4qI0sN+XRXuR0DHn9PZ4g2Yjb
    tik814KbvI8fTEhGzTqa4sHaYKyrG3Ps80+100JdleBEQYjjQiI+
    -----END CERTIFICATE REQUEST-----

    EOT
    "private_key" = <<-EOT
    -----BEGIN RSA PRIVATE KEY-----
    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
    -----END RSA PRIVATE KEY-----

    EOT
  }
}
```
