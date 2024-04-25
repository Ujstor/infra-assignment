variable "certificate_authority" {
  description = "Object containing variables for certificate authority."
  type = object({
    common_name  = string
    country      = string
    locality     = string
    organization = string
    unit         = string
    validity     = number
  })
}
