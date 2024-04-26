```bash
 terraform init

Initializing the backend...
Initializing modules...
- external_ip_info in modules/external_ip_info

Initializing provider plugins...
- Finding anschoewe/curl versions matching "1.0.2"...
- Installing anschoewe/curl v1.0.2...
- Installed anschoewe/curl v1.0.2 (self-signed, key ID 20E817F6C12509ED)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

```bash
 terraform apply
module.external_ip_info.data.curl.ip_info: Reading...
module.external_ip_info.data.curl.ip_info: Read complete after 1s [id=1714169417]

Changes to Outputs:
  + internet_provider_info = {
      + asn     = "AS3320"
      + country = "Germany"
      + ip      = "46.152.12.12"
    }

You can apply this plan to save these new output values to the Terraform state, without changing any real infrastructure.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes


Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

internet_provider_info = {
  "asn" = "AS3320"
  "country" = "Germany"
  "ip" = "46.152.12.12"
}
```

