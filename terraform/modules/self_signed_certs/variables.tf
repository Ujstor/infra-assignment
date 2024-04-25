variable "certificate_authority" {
  description = "Object containing var for certificate authority."
  type = object({
    common_name  = string
    country      = string
    locality     = string
    organization = string
    unit         = string
    validity     = number
  })
}

variable "server_certificates" {
  description = "Map containing var for server certificates."
  type = map(object({
    common_name  = string
    country      = string
    locality     = string
    organization = string
    unit         = string
    validity     = number
  }))
}
