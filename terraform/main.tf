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
    server-1 = {
      common_name  = "server1.site.contoso"
      country      = "DE"
      locality     = "Munich"
      organization = "contoso"
      unit         = "site"
      validity     = 8760
    }
    server-2 = {
      common_name  = "server2.site.contoso"
      country      = "DE"
      locality     = "Munich"
      organization = "contoso"
      unit         = "site"
      validity     = 8760
    }

  }
}

module "external_ip_info" {
  source = "./modules/external_ip_info"
}
