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
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "tls_cert_request" "server" {
  private_key_pem = tls_private_key.server.private_key_pem

  subject {
    common_name         = var.server_certificates["common_name"]
    country             = var.server_certificates["country"]
    locality            = var.server_certificates["locality"]
    organization        = var.server_certificates["organization"]
    organizational_unit = var.server_certificates["unit"]
  }
}
resource "tls_locally_signed_cert" "server" {
  cert_request_pem   = tls_cert_request.server.cert_request_pem
  ca_private_key_pem = tls_self_signed_cert.ca.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.ca.cert_pem

  validity_period_hours = var.server_certificates["validity"]

  allowed_uses = ["server_auth"]
}
