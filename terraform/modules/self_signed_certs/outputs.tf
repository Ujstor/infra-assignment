output "certificate_authority_private_key" {
  description = "Certificate authority certificate"
  value       = nonsensitive(tls_self_signed_cert.ca.private_key_pem)
}

output "certificate_authority_certificate" {
  description = "Certificate authority private key"
  value       = tls_self_signed_cert.ca.cert_pem
}

output "server_certificates" {
  description = "Map of server certificates with private_key, certificate, csr"
  value = {
    for key, _ in var.server_certificates :
    key => {
      certificate = tls_locally_signed_cert.server[key].cert_pem
      csr         = tls_cert_request.server[key].cert_request_pem
      private_key = nonsensitive(tls_private_key.server[key].private_key_pem)
    }
  }
}
