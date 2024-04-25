output "certificate_authority_private_key" {
  description = "Private key of certificate authority."
  value       = tls_self_signed_cert.ca.private_key_pem
  sensitive   = true
}

output "certificate_authority_certificate" {
  description = "Certificate of certificate authority."
  value       = tls_self_signed_cert.ca.cert_pem
}
