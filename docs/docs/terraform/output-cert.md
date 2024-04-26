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
          + common_name = "server2.site.contoso"
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

module.self_signed_certs.tls_private_key.ca: Creating...
module.self_signed_certs.tls_private_key.server["server-1"]: Creating...
module.self_signed_certs.tls_private_key.server["server-2"]: Creating...
module.self_signed_certs.tls_private_key.server["server-2"]: Creation complete after 1s [id=09c058c4d729344f896cd12d23bde9727f290301]
module.self_signed_certs.tls_private_key.server["server-1"]: Creation complete after 1s [id=0936f6aed02a8c11ec104ee7320d9f4535ed087c]
module.self_signed_certs.tls_cert_request.server["server-2"]: Creating...
module.self_signed_certs.tls_cert_request.server["server-1"]: Creating...
module.self_signed_certs.tls_cert_request.server["server-1"]: Creation complete after 0s [id=1ab101d9c71a3c07f0b3bc7191d7d192239b07c6]
module.self_signed_certs.tls_cert_request.server["server-2"]: Creation complete after 0s [id=1abecf37fc3fb361e1a2b80a64a608b9450eb506]
module.self_signed_certs.tls_private_key.ca: Creation complete after 1s [id=d813e72d10e7188131b1fb016db08965c24a30c0]
module.self_signed_certs.tls_self_signed_cert.ca: Creating...
module.self_signed_certs.tls_self_signed_cert.ca: Creation complete after 0s [id=12878792340195351101032375134765420205]
module.self_signed_certs.tls_locally_signed_cert.server["server-1"]: Creating...
module.self_signed_certs.tls_locally_signed_cert.server["server-2"]: Creating...
module.self_signed_certs.tls_locally_signed_cert.server["server-1"]: Creation complete after 0s [id=328317067375566004161315438862049222652]
module.self_signed_certs.tls_locally_signed_cert.server["server-2"]: Creation complete after 0s [id=258174516333145034652960632955132875003]
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
MIIFVjCCAz6gAwIBAgIQCbBdfInKCAOxgoPYghOOrTANBgkqhkiG9w0BAQsFADBW
MQswCQYDVQQGEwJERTEPMA0GA1UEBxMGTXVuaWNoMRAwDgYDVQQKEwdjb250b3Nv
MQ0wCwYDVQQLEwRzaXRlMRUwEwYDVQQDEwxzaXRlLmNvbnRvc28wHhcNMjQwNDI2
MjMxNDM4WhcNMzQwNDI0MjMxNDM4WjBWMQswCQYDVQQGEwJERTEPMA0GA1UEBxMG
TXVuaWNoMRAwDgYDVQQKEwdjb250b3NvMQ0wCwYDVQQLEwRzaXRlMRUwEwYDVQQD
EwxzaXRlLmNvbnRvc28wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCT
HheMAny7Tk+dhJb6yclNeyt8uicN3PdOhui/6RJLr14hPn7V2t93YZG4kWVaclvA
uPClSBSiEM+hXSvyqQNsU8W5jHb9Z5RIZdJQ4BS7n2DHw/zdGjmb+Kq/GE7TU6+t
NE82oE/+CKSps9awONGs8TTXM/pj60WvAjKP3abDzy59qItmnFLPCcaR1L9Zrrdh
K/RNwAkHOr2xwksE9aOEnVgrLIxM6uoTAQKyJ5Io6Kw+zTIZ8sKh0rzCMu1Op71F
G2WbggHJQul7t/7BnJgXOSRfGo83JPYPIyharbn30cvveY9N644uQZlKGqL2bwaT
eJ5lKWD5OpCZUmnqEyUthWl0GZranMeqD08L9wbGhaMTNpWGhTpezDgLKpxh8UaU
qOMAOsgNZC1HczhFTd+C+gJStUs6pWG4vOJ35BcDtfMw/Z01CJgu7etuk6G7bHZN
DJHrpc0Noeee8vjUzObw7nj/9P4yqT85Ft7RMg2YHaWd2kzNajYhCGm/u1pHWxy3
hRoZArnoB7dCnR88pjQeuR6Kj9F/k6OMppXBrzlLBCsVTEkEEOvSaodxny0fhhtr
EsVWI2NUp2nq+qpIHIZTCQvGFoZBxn1LqlgODJ279oNVGN5B6yXN9iGeVuygXca9
6f7CRTr1AlBwwtHKgVF/J5MmruIo2hMoU7NB+DBshQIDAQABoyAwHjAOBgNVHQ8B
Af8EBAMCAgQwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQsFAAOCAgEAU5KjOCxo
ZLOc8SlNEup6jVZ2bhkGivL2033qaUbGSYCBd5GiZUMOyF/gqujLbZSaYMx15jah
WERjn9yO5TkJKEB7pgESOtXwGs7v8MYnjein44QCsaNTTAL9hvIYUeS9hOEB7vEA
cqjPM7QPes4TqBTcBVWo5bn0Dtxy9vad3RBFQpBF47If5kSLYGlITXsRXBFblF96
0RhB0SSf9MV8PgM3c6ZT7uggkTGRJJ0RE/FGCpQ8tM6Lnz98JWsWwNeFcwRKzZGb
8/sFr05QUagfteYt0xkpc8vkd0vyvkRG0/DqF/mhEHQx4u0VGgb87dWVMmleMUeN
zv1+0pKiwFWgb3tv1rSGpZ+H93tr3ZBNK6mXb23Zg4TioZawAhcZkcIZ5NLXaShG
KKf1gSpiJjv0pttU4EVVOsopnVoPIIs851++3G3Zf+lhna5djWhwmHvUrfIEjURV
mVRQNuz7DbAsYgIFCy3hc8gq7X37Pd5assqcqTpWoQdkWHJWWpgM1FXmgct5NH/i
rHOI7nq4ZJVAGiNSPNbWMBrPBOKS2jFhyibRgM72iVESxiGtcIisPyjjDxPBnRhy
8i1LmSimKB/RkR+aROvEx+by8yUT4DK/TLN5PvIFvepPp/f3fMBwIvytltX8rb1E
7D/1qbX7RSglUS6Qc5yz1M4uN45SnqYwkDc=
-----END CERTIFICATE-----

EOT
certificate_authority_private_key = <<EOT
-----BEGIN RSA PRIVATE KEY-----
MIIJKAIBAAKCAgEAkx4XjAJ8u05PnYSW+snJTXsrfLonDdz3Tobov+kSS69eIT5+
1drfd2GRuJFlWnJbwLjwpUgUohDPoV0r8qkDbFPFuYx2/WeUSGXSUOAUu59gx8P8
3Ro5m/iqvxhO01OvrTRPNqBP/gikqbPWsDjRrPE01zP6Y+tFrwIyj92mw88ufaiL
ZpxSzwnGkdS/Wa63YSv0TcAJBzq9scJLBPWjhJ1YKyyMTOrqEwECsieSKOisPs0y
GfLCodK8wjLtTqe9RRtlm4IByULpe7f+wZyYFzkkXxqPNyT2DyMoWq2599HL73mP
TeuOLkGZShqi9m8Gk3ieZSlg+TqQmVJp6hMlLYVpdBma2pzHqg9PC/cGxoWjEzaV
hoU6Xsw4CyqcYfFGlKjjADrIDWQtR3M4RU3fgvoCUrVLOqVhuLzid+QXA7XzMP2d
NQiYLu3rbpOhu2x2TQyR66XNDaHnnvL41Mzm8O54//T+Mqk/ORbe0TINmB2lndpM
zWo2IQhpv7taR1sct4UaGQK56Ae3Qp0fPKY0Hrkeio/Rf5OjjKaVwa85SwQrFUxJ
BBDr0mqHcZ8tH4YbaxLFViNjVKdp6vqqSByGUwkLxhaGQcZ9S6pYDgydu/aDVRje
QeslzfYhnlbsoF3Gven+wkU69QJQcMLRyoFRfyeTJq7iKNoTKFOzQfgwbIUCAwEA
AQKCAgBrj0Wx9KOTIhctWCI2a0+FGXda8pLZHOOnAxWqMdJRiX6tmY6L9kEJfElZ
AtxyO0f/6HbwsHl9YAMdvAwElzNMgRb/qMXaUV9layRQQvSFlGniw9TdJm5WLYFQ
w4nmEbpQTP1ZN+4kEdepxzVAk9ogsh1q9bKsWPgSku26p1hkstYPwylgNQyKGGCY
gE4CWK30Gnm8Wpl/MqA8FYxZrOoHbC5pKmHNXrcSe9unuyyuQiakp8tok0dfnr6o
0SkVJ6hGnVg1UODTb9tau9RDY6UC3aFM8xMgQyKvQIohegCMQlPy2xI96umBwi47
sqvQtq29JiPQXGds8DeGEW4kWCkGOkoFfb1XJXG4MBa1PuJNAelDRtS5oPY8LuGd
a8MNJCxOGQWZeSBuKaIGFqt4Dzt/6xWFxmw6h/TWSh05MMfUraHNEwBDrmrD3xwW
e8lC/5A09HAtoxtE0mF/T17c6YspOFLUptPuY1sDD0iyOZibCjUXzrixjPHpRmwy
g9AauuakuNRt/WqYhpk9lK31GlPm5cRcKq8XTKTRFh3Tz0OMocSebTJIBCoSAMAi
9F2JBsmix4dyaTp0JVq1+728KhAnGlp//gV8FkC+b3gfhXhEuTGxH1SLZs8E/Cxa
RAeqlorq8hdcsRGR7P3Y3V1L4IBdG7NcZRAAnPQOwgVh7dVuIQKCAQEAwFsajv11
6gfCoonpNWdqXzAIGGV2JAauTwCOI3AsoiCWeyKRAOs2W8WP32z33w5g5LO1exbi
vmKSMFQkPnRkDz/cDZfK4wFLdaK9wgtT/H2XASaO+hKePGhDlTazBbbw7a12IPPm
uGZAr9KoyZIJ23ichZfys6Rjeqj4RrgCSzfrCG2DruPXA1QWI5oEmmia/cQebEvp
Yf/Etr5whbgS2oDoNQoVjRRfpY4hpWd5ctC2CwiqMeEAscpbl+qsl1oqhAoS4aGp
H3NcnVEHtNGYjXj2q992/vDGCV/t6Ard/vh/xSsRSw5c5Q2hXGdE2EBHaVzp85m/
I4LkXcVTT0Ur6QKCAQEAw8s3/s4zTMcbqZOz03mmrljmbw0KHUDDMDOSDMZWcwc6
RdE4CVLqCA6O2y580Hrv4RQzwA1YuAKbJoQ7ilFC2Cf86SdixSepJKtf0ThgmtoJ
DVpOsUplqe0hsQT+2Z1Jw10EeVUdsSolgpoBni26qdi/zs7Z1sB3pDeLYDXcj/Vi
g/dcrbx8SIvy8EWVAllRBRJb8cuI3tILsyySiTwrbzy+dWMuccsNWR4+TesgV+64
+khan1kroLNIrUFXfHOMPXf/kuAhD4+QaFEY6qwFkX5x2MGBxGrH04gN2u34NsI5
ZOFKNi1/RcxH8WyP0BQ9Dwpd9iRuUv855lahQ1GGPQKCAQB6Ghqcw9WSrkRlqsdn
h/Lk43dwDQ/WRItnSMHxSuZ6L9d16HZFMAm8bYcrW19orxbgdhbwQJHEKowDs5Wi
M33ElFPaKQ231X2R+bEcuNYiQ5KUP2ao5SKe08x6rlMrgHolVWPT/R7q1LWhJkbQ
VSx+rWwl/VMpp2MiXJnlQi7qkl9WZTYe0TAOQ9Ud2kmrvlUMWu647eMCuzmiivag
Wz1UiFleOb1+ZX1lePhwp2NXd5bnICPxL5OiSAKmR2gxVyH/2OktYtIZTcBveB09
MYL14uAqL9q4cBw1nThGgId0r0dj4DfE/iQHngRcxIzV/M+X2UwEvwauwwq1X2nH
uu/pAoIBAGITHY1pRJEk+1pKPj2kJjYXGfZula5pjlxKuNHlV9BuwmXOkz84ZTp7
8FsiQis8KYSZVgLRrKsfww/cFOcIJW+ZODqiG/ueDj/sCCcJEnr+1KH3potwNNSV
j9bYJcBj5VsS8PbGCAWCkx+EfWL6jRIfHJU/UCceac+8cvhSgpUp2Zs5AReV3ruI
PrzUXfu7ObZMp/nKdlkG5g1uOki79xXVW6H5eH5Ps/P8DkGBkcX6MnZMX/iJ9iyd
Ib6HiIcyagEwZrjvxB/DThay6MREPtXOfMCSzanRwx7We/o6Uac8SvuZTk8tIx+X
YEIymycjvCIYk1CEly7D4gDbTBQodhECggEBAKUEREMhUHI4dGuEDwMSRzSb9imE
MntlIeDLkFHA7wonN9mmdmhSj0T7NKDbxcdq/nkNfPpQfEZ19PXu3ZFGqGGTr0Yy
P01EHODuM1v4C3II+zWCFIupCglC/MWGzCZv3AZTE5JJohx0ZKZZQJg1m+iOAu9i
4RduEniYc/jpGy22D2yet9KWxCIVosSH6t9lr9swrg/dF6EXZ375EpWFygmc8Bed
lEv4/6G6DOVrbvFS7ZcgNGnUsdvtzb14rfKb0YKcyZ2dtkVlVhUQ3FxWOf2eZRSg
ZUcEWhPqhvnkh6f9KtdWlHrraOGis/23igBJvmSbQPUQavtGHdrfq6owVqw=
-----END RSA PRIVATE KEY-----

EOT
server_certificates = {
  "server-1" = {
    "certificate" = <<-EOT
    -----BEGIN CERTIFICATE-----
    MIIFZDCCA0ygAwIBAgIRAPb/kS+Cplh2nGsC15cwH/wwDQYJKoZIhvcNAQELBQAw
    VjELMAkGA1UEBhMCREUxDzANBgNVBAcTBk11bmljaDEQMA4GA1UEChMHY29udG9z
    bzENMAsGA1UECxMEc2l0ZTEVMBMGA1UEAxMMc2l0ZS5jb250b3NvMB4XDTI0MDQy
    NjIzMTQzOFoXDTI1MDQyNjIzMTQzOFowXjELMAkGA1UEBhMCREUxDzANBgNVBAcT
    Bk11bmljaDEQMA4GA1UEChMHY29udG9zbzENMAsGA1UECxMEc2l0ZTEdMBsGA1UE
    AxMUc2VydmVyMS5zaXRlLmNvbnRvc28wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAw
    ggIKAoICAQCyJiHhhOpwqH156HMeOw1wd0UlSalmvAt7GMcLi0ZDRQHNI/h5lmGh
    zKfhNpnO37gqWXmd4VSPoSl5259hPW3eymQwZnoH5IdS5WYUObDdzgGsmzEFUoew
    ujM7ktZ4Bu5UUMchelB/LxSz3zPHhV+UAgpCdqet9+IM3xk/6558FzhJxBx0yqmE
    GWIP222cO0QTqgcqIGXKoOz1W2UhOkoe3hJoTd9mJRHHwXZPph04NXCX2GRgbb+i
    zwXWNbNoC2BiD/uTUX9GfS/yHEzGR0sRsNa0GykTNMzj6qfXlBrUrsYQbTgrTsPW
    RsebuJESfzu1lzM5SOQaABU4EmOKEWrZZ923wOwm+SX/nQNkLtiQwWdhMsfzrm0r
    563ARRsZ3Hu4IP1N2laCBa+H+dWmF0PuabWhB3eRlYhKOnuUdJl/x4loAlfjOImf
    OvvSs0wboskkJ6ro5qghiKhkjYRLYxKB2kr4q4kkuiK+h1ZZy/AFnAoOKzRwpUgX
    8juEtc0VUWRG8nn4xfQuWiHDk+9rEYOqSY/E9M47v3JeYLwVMKLACSkCDnL606K8
    VSs9WqxE+6Yg+abnZule7Kbk1lsBw/spW92fkdMmjlysJxAQsvTOjCPudJRrD0CY
    ny/oC0ctYOyBEuSNRWsfZOHe/+fw2UqlM03H0Pa1cNc2toOH3Jq22QIDAQABoyUw
    IzATBgNVHSUEDDAKBggrBgEFBQcDATAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEB
    CwUAA4ICAQBYzkvddr7yJyU4ivONHOlzuFCbO9vmFM2h0vO3cbKINZo9H6VaTsGe
    F5BKbo2ngVc4If3y1qRu9T6u2fqSXSypEublC16cOxGd/0emehxtk0EYPnHYvhpV
    rMXNozBE/C48BXMi+zuH4ZT1J1Zh1splA/MntCGxauGxkfhPDTjAChw407hvyIlw
    2qwfjsgL1C8nAfLZaNWCzSqdPeq6dUfTA4AvtCEitZl8bvEt02W6IVwTiFTY6xYy
    JpUsBWPQR18zPkED9HEEz2Q8PodzqmNZhUw6VPQuOtUzK3JzycVNqASHeDaHQthm
    1PXWMLeQX8tSMEvDB0gpLXRgj0jgMrelEKXIl74KlwbnDTGnGSLuZYV+iIKTrUv3
    7e4FVHyg39aDFq+StYDmzmuKonQCjdrhfT63aYPzKR/cR12OY7GvcQ8aNhHu0RPL
    y/fdj7z3xHYodluBkqBbPbSXsaIaTFlgJ8h1/D3fs67xT7J5ZxdfWkk45JR+6NB2
    dKDSb5DU5tHyi918HYLcR9nQ4PPDPVbJ2yqP8vWT6BxZ02teSHTfUdTTW8lQza5s
    yfXgreaKsO3YRZi88pxfeVTUU4pfrYgBfMvUTEFW3cFx5YgYtC5UxWOTU1mpotTr
    sF87avvDcnyktPbVi9D3oV0WTHqM+Iuv1/rt5TnVqiyP7foX4XKgzw==
    -----END CERTIFICATE-----

    EOT
    "csr" = <<-EOT
    -----BEGIN CERTIFICATE REQUEST-----
    MIIEozCCAosCAQAwXjELMAkGA1UEBhMCREUxDzANBgNVBAcTBk11bmljaDEQMA4G
    A1UEChMHY29udG9zbzENMAsGA1UECxMEc2l0ZTEdMBsGA1UEAxMUc2VydmVyMS5z
    aXRlLmNvbnRvc28wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCyJiHh
    hOpwqH156HMeOw1wd0UlSalmvAt7GMcLi0ZDRQHNI/h5lmGhzKfhNpnO37gqWXmd
    4VSPoSl5259hPW3eymQwZnoH5IdS5WYUObDdzgGsmzEFUoewujM7ktZ4Bu5UUMch
    elB/LxSz3zPHhV+UAgpCdqet9+IM3xk/6558FzhJxBx0yqmEGWIP222cO0QTqgcq
    IGXKoOz1W2UhOkoe3hJoTd9mJRHHwXZPph04NXCX2GRgbb+izwXWNbNoC2BiD/uT
    UX9GfS/yHEzGR0sRsNa0GykTNMzj6qfXlBrUrsYQbTgrTsPWRsebuJESfzu1lzM5
    SOQaABU4EmOKEWrZZ923wOwm+SX/nQNkLtiQwWdhMsfzrm0r563ARRsZ3Hu4IP1N
    2laCBa+H+dWmF0PuabWhB3eRlYhKOnuUdJl/x4loAlfjOImfOvvSs0wboskkJ6ro
    5qghiKhkjYRLYxKB2kr4q4kkuiK+h1ZZy/AFnAoOKzRwpUgX8juEtc0VUWRG8nn4
    xfQuWiHDk+9rEYOqSY/E9M47v3JeYLwVMKLACSkCDnL606K8VSs9WqxE+6Yg+abn
    Zule7Kbk1lsBw/spW92fkdMmjlysJxAQsvTOjCPudJRrD0CYny/oC0ctYOyBEuSN
    RWsfZOHe/+fw2UqlM03H0Pa1cNc2toOH3Jq22QIDAQABoAAwDQYJKoZIhvcNAQEL
    BQADggIBADfosAFtL7G2BGo8stSXnGSEAejY7AfJbWy2aQ0YF1OqsQvBPnGhlMub
    mffpOvmhgB2tYCkyzQEqTQgTDAjA+djH/WpPWT2RY0873wRWSs74gAJXlF3S8MVN
    VF8DKYPaE3eyMaM3ESbvmD2+naSyBqrnzg6G2AZcgoZ2aHEfkyGzwGoe49bC1rav
    5E/XEWcibxZ1LFOPSGkVGwM8pSGbKBRKW2skxPssPwQskE1YCu1dP7JOnl4RJ5Ev
    6com0tkBfmcpO5S4U1QmtTfSQJVCyZOnjxR5uOu+4rthwqkOsy8qzZg4II8TLf5J
    kvmxS4t0QaLAQoo0uVQ+YsKlePQQelm+A94Bg4BlXVUGolXifbMdymfiM9fuRnFn
    sQNGS8p7EwkIpIKBK9iFbrjCERRXZVHXRzLiXEBi4CMw2MvVupzqntMAbZaURoeu
    9v+1qDaVL2CHzu+SxbL/F8CyDO8g7It/CmeplBlcVBV+nl3ZXBX/WrX/h8hTiasx
    axV/ZfGBhEDh8hx0tN8nJYq08G6HkujohDIX6w+48cazLYhyrvhSgq/8IPdx3vfy
    9+iOGmZqebjrWdxBbJAE85b/eK2gwMZ1F8nvX6GX6wJXVhfQVqZWRI6N0vl45Wmi
    PdUvGRI1nrQzgaf/9u9DAGMj7JVphupOMMuglK5Wq0pWDbNf1FBb
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
    MIIFJTCCAw2gAwIBAgIRAMI6mmqNkI7hdhndUh8qkPswDQYJKoZIhvcNAQELBQAw
    VjELMAkGA1UEBhMCREUxDzANBgNVBAcTBk11bmljaDEQMA4GA1UEChMHY29udG9z
    bzENMAsGA1UECxMEc2l0ZTEVMBMGA1UEAxMMc2l0ZS5jb250b3NvMB4XDTI0MDQy
    NjIzMTQzOFoXDTI1MDQyNjIzMTQzOFowHzEdMBsGA1UEAxMUc2VydmVyMi5zaXRl
    LmNvbnRvc28wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDVELHPd2Zd
    82Y88siMRQtQHSAx9MvfCZQwcVbZFfPjAOI7Rpi3mD/X6c/K40sZMLdx7sDSIxaF
    xQNKpP18kor6aChrV23ThCQdogadHAHDkvJJW75SyzRneNTAb0AwY3BwBVx+E6RX
    mf4fHKM8MGD2J7P0Q5WXZGGRGagTUhECgdTg/21yjm7KehNynKPOxXEWLOGE+/To
    403vmCL+8+WbE9jT0kJTxbhSvCUpeZdFecG492ymIemjWQZ3x+hB0uTqodAbX92I
    DsC7sQV/GZCGRiovMCaLPvNItLAsP00dEHgQNv+ATOtaDaEfjdu2CSB0zInNAJKL
    IgJ9r/rdgqYQGrLXB59lg0VtqkeQAEv634STHxDjRWys9ZhsJmOtlhqwwU20+g0i
    mrCTAGpv6SQC11yqrh5LzlFFXIJlCCGhazrJgNAV3tZaHPHqLOhL2a88IPnPK74U
    C1s/TPyU1RSwy9gziSWr4FCYxKR07m39hCo+TDniNTBayZ8gtwDg2qQ7g/GN8Q4Q
    8dM8UNRs76elLPT8y3l1MpAF9RZyZDEaR4uOBdxHo9dKNs1Jn+1neCNHllBU6AIG
    50c6ddOnTZQxz+aHjx5GV4oXaViRgcoTwpb9OQBIqsJwC/bCgPsh/LL5xd25Hx0M
    hGXOFLPm+k2rqhgDntcRbarEZ6SITdn4LwIDAQABoyUwIzATBgNVHSUEDDAKBggr
    BgEFBQcDATAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBCwUAA4ICAQCKv/pvufFQ
    KYnulXBp/nOSlhsDraFrSlq4zNIf74lpZQxSaawx0afFqiXqn1qIsRTGXtbxcARz
    QXKvmDs6pfIj1yvlS2+byXXSbbQmJI1OD1jtpmAim965A9q4Fc8ubDY1XoOPPpnh
    de8YNClES23FIZ4f4BimFNB+FltmhbUcxLYCMSZxvxi+0lu7uPnvXqnkfeaAYR24
    bPeVOqJs4/84gYY5dg+PwXxVcdqf3+CbOiynlVtPID26cAMDeZgLO7KhSXD3DWZL
    7GS/EB1EqOGstJO4d3ggZYjGwW4DOSZq3wylOdCyBvkHmj/sr6VwPknT8h5sU1P/
    E1l64drlw+PhFj4uEi9+aGK41MNxkyiRCtfTHdwhBqyn3CzAchavvku++1MzAjJb
    Gtbj+lLIyAKSeBflF0OmCN8I370oEGXq9mprBKEOjFJipn8FuiCFIoGAe1o2T03H
    mXO0R4UD9Vuq4sx54hsYSDn/4VJ/59Bs2LbXh+ewNAKSIGF5Puv9wbc2Yxjgcl6K
    pjCaFv219chLn3XPlpgP/ih20kOxRHF1oyMQmBD5dua/R2MubO94VPDCxhVUTAnJ
    b+r+0EW20A2n0WvZ9aE+2Vw8fEtNNadBL/yKNqvk7/zDWWp1IBLHaJtwHEnkZRF2
    Fpp5q5uDTWI30t0EKYTUoFpa+mgDG8n1ew==
    -----END CERTIFICATE-----

    EOT
    "csr" = <<-EOT
    -----BEGIN CERTIFICATE REQUEST-----
    MIIEZDCCAkwCAQAwHzEdMBsGA1UEAxMUc2VydmVyMi5zaXRlLmNvbnRvc28wggIi
    MA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDVELHPd2Zd82Y88siMRQtQHSAx
    9MvfCZQwcVbZFfPjAOI7Rpi3mD/X6c/K40sZMLdx7sDSIxaFxQNKpP18kor6aChr
    V23ThCQdogadHAHDkvJJW75SyzRneNTAb0AwY3BwBVx+E6RXmf4fHKM8MGD2J7P0
    Q5WXZGGRGagTUhECgdTg/21yjm7KehNynKPOxXEWLOGE+/To403vmCL+8+WbE9jT
    0kJTxbhSvCUpeZdFecG492ymIemjWQZ3x+hB0uTqodAbX92IDsC7sQV/GZCGRiov
    MCaLPvNItLAsP00dEHgQNv+ATOtaDaEfjdu2CSB0zInNAJKLIgJ9r/rdgqYQGrLX
    B59lg0VtqkeQAEv634STHxDjRWys9ZhsJmOtlhqwwU20+g0imrCTAGpv6SQC11yq
    rh5LzlFFXIJlCCGhazrJgNAV3tZaHPHqLOhL2a88IPnPK74UC1s/TPyU1RSwy9gz
    iSWr4FCYxKR07m39hCo+TDniNTBayZ8gtwDg2qQ7g/GN8Q4Q8dM8UNRs76elLPT8
    y3l1MpAF9RZyZDEaR4uOBdxHo9dKNs1Jn+1neCNHllBU6AIG50c6ddOnTZQxz+aH
    jx5GV4oXaViRgcoTwpb9OQBIqsJwC/bCgPsh/LL5xd25Hx0MhGXOFLPm+k2rqhgD
    ntcRbarEZ6SITdn4LwIDAQABoAAwDQYJKoZIhvcNAQELBQADggIBADIQsD986FrA
    rLrHS5wLpH3uSBytSRqkGQORhQjiByRNz9pYH6WG4GXu9T/OrB++DoV34UaCHhXt
    sF5Y5C6hAvpXq7A4RsFByfMd1i1n5rFOE2+X8TOlF8dpIgWfPBfq8jdm3O5A96uH
    /lanodw35Hqlfu7e61NI4GrfBaMKLuItGc1DWmFpLXI19xSZHfLnoEOzZrEtcoo0
    bewraE5VvxNVLg1J5iHu3YtPRA/a6XLPa53BcO0ZHbxkZZf4DgexIHpx5zY50t+2
    Z69F8zy7TQnjsZ0MrOmyxwA1z8ZHdwEWPWNf64Hb+JEkn7mZblTSOaQF7u1l1yD+
    AeIDLAFLgKWx6C2o62cXa6nrWrkClY6cbS+08espqi7iUzzeV4OuJW+cIU2qq/2G
    A74SjMQ+FnjJ1OMl9YuylAZSIiqTZpxdzzwd+QhFI/MqJCkof53tskk/F2CVwUB0
    ySDHLVr/DlrX22lCwBP+v817OvfQT13dqSQQ35OljvCifj31hvLwi7znQhhHeH1s
    OAfJLn7rkQEIGBF+UDJZ2zPYhpS6cjznUeclQQGXPJVbHSUeexwCVb7utBihoop0
    jYvAYdI+rU9dDgfmQqueddLpifbcDCWko71sqiNlAAMyrdTKAFjsmjSCHqx6bOCD
    j9d78D3PkmyuPr8t0vBaSo4UTRg+06oX
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
