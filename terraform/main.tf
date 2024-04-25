module "self_signed_certs" {
  source = "./modules/self_signed_certs"

  certificate_authority = {
    common_name  = "site.contoso"
    country      = "DE"
    locality     = "Munich"
    organization = "contoso"
    unit         = "site"
    validity     = 87600
  }

  server_certificates = {
    common_name  = "server1.site.contoso"
    country      = "DE"
    locality     = "Munich"
    organization = "contoso"
    unit         = "site"
    validity     = 8760
  }
}

output "certificate_authority_private_key" {
  description = "Private key of certificate authority."
  value       = module.self_signed_certs.certificate_authority_private_key
  sensitive   = true
}

output "certificate_authority_certificate" {
  description = "Certificate of certificate authority."
  value       = module.self_signed_certs.certificate_authority_certificate
}

output "server_certificate" {
  value = module.self_signed_certs.server_certificate
}

output "csr" {
  value = module.self_signed_certs.csr
}

output "server_private_key" {
  value     = module.self_signed_certs.server_private_key
  sensitive = true
}
