locals {
  json_data = jsondecode(data.curl.ip_info.response)

  internet_provider_info = {
    asn     = local.json_data.asn
    country = local.json_data.country
    ip      = local.json_data.ip
  }
}

data "curl" "ip_info" {
  http_method = "GET"
  uri         = "http://ifconfig.co/json"
}

