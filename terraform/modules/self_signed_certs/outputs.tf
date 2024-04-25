output "certificate_authority_private_key" {
  description = "Private key of certificate authority."
  value       = tls_self_signed_cert.ca.private_key_pem
  sensitive   = true
}

output "certificate_authority_certificate" {
  description = "Certificate of certificate authority."
  value       = tls_self_signed_cert.ca.cert_pem
}

output "server_certificate" {
  value = tls_locally_signed_cert.server.cert_pem
}

output "csr" {
  value = tls_cert_request.server.cert_request_pem
}

output "server_private_key" {
  value     = tls_cert_request.server.private_key_pem
  sensitive = true
}

