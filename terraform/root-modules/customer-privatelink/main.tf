# DEMO REPO — mirrors the shape of a customer-privatelink root module.
# Nothing here is applied anywhere. PRs against this file are opened by the
# PrivateLink desk's cloud agent and merged by a human reviewer.
#
# Each customer is one entry in `endpoints` (Step 1: interface endpoint) and,
# for Path B, one entry in `custom_dns_name` (Step 2: PHZ + CNAME from the
# customer's browse hostname to the endpoint's regional DNS name).

locals {
  endpoints = {
    # Acme Rockets, team 111111. Onboarded 2026-07-14.
    acme_rockets = {
      service_name        = "com.amazonaws.vpce.us-west-2.vpce-svc-0aaaaaaaaaaaaaaaa"
      private_dns_enabled = false
    }
    # Meridianrobotics, team 424242. Ticket t-6268f6f9.
    meridianrobotics = {
      service_name        = "com.amazonaws.vpce.us-east-1.vpce-svc-0a1b2c3d4e5f60718"
      private_dns_enabled = false
    }
  }

  # Path B: private hosted zones + CNAMEs. Every customer needs this — an
  # interface endpoint's dns_entry never surfaces the service's private DNS
  # name, so the browse hostname only becomes resolvable via a CNAME here.
  custom_dns_name = {
    # Acme Rockets — ghe.acme-rockets.example -> endpoint regional DNS.
    acme-rockets-example = {
      zone_name = "acme-rockets.example"
      cname_records = [
        { name = "ghe", value = "vpce-0aaaabbbb-cccc.vpce-svc-0aaaaaaaaaaaaaaaa.us-west-2.vpce.amazonaws.com" },
      ]
    }
  }
}

module "customer_privatelink" {
  source          = "../../modules/customer-privatelink"
  endpoints       = local.endpoints
  custom_dns_name = local.custom_dns_name
}
