# privatelink-demo-infra

Demo stand-in for the Terraform repo where customer PrivateLink endpoints
live. The [PrivateLink Desk](https://github.com/anysphere/privatelink-enablement-agent)
opens real PRs here via a Cursor **cloud agent** (authored by the Cursor
GitHub App); a human reviews and merges them, and the desk advances when the
merge lands.

Nothing in this repo is applied anywhere. There is no state, no Spacelift
stack, and every value is fake.

Layout mirrors the real thing just enough for the demo:

- `terraform/root-modules/customer-privatelink/main.tf` — one `endpoints`
  entry per customer (Step 1) and one `custom_dns_name` entry per customer
  (Step 2, Path B PHZ + CNAME).
- `AGENTS.md` — edit rules the cloud agent follows.
