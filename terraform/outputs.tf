output "certificate_authority_private_key" {
  description = "Private key of certificate authority."
  value       = module.self_signed_certs.certificate_authority_private_key
}

output "certificate_authority_certificate" {
  description = "Certificate of certificate authority."
  value       = module.self_signed_certs.certificate_authority_certificate
}

output "server_certificates" {
  description = "Server certificates."
  value       = module.self_signed_certs.server_certificates
}

output "internet_provider_info" {
  description = "Internet provider info."
  value       = module.external_ip_info.internet_provider_info
}
