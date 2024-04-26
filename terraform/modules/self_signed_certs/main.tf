resource "tls_private_key" "ca" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "tls_self_signed_cert" "ca" {
  private_key_pem = tls_private_key.ca.private_key_pem

  subject {
    common_name         = var.certificate_authority["common_name"]
    country             = var.certificate_authority["country"]
    locality            = var.certificate_authority["locality"]
    organization        = var.certificate_authority["organization"]
    organizational_unit = var.certificate_authority["unit"]
  }

  validity_period_hours = var.certificate_authority["validity"]

  allowed_uses = ["cert_signing"]
}

resource "tls_private_key" "server" {
  for_each  = var.server_certificates
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "tls_cert_request" "server" {
  for_each        = var.server_certificates
  private_key_pem = tls_private_key.server[each.key].private_key_pem

  subject {
    common_name         = each.value.common_name
    country             = each.value.country
    locality            = each.value.locality
    organization        = each.value.organization
    organizational_unit = each.value.unit
  }
}
resource "tls_locally_signed_cert" "server" {
  for_each = var.server_certificates

  cert_request_pem   = tls_cert_request.server[each.key].cert_request_pem
  ca_private_key_pem = tls_self_signed_cert.ca.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.ca.cert_pem

  validity_period_hours = coalesce(each.value.validity, 8760)

  allowed_uses = ["server_auth"]
}
