# Rules for agents editing this repo

This is a demo mirror of a customer-privatelink Terraform root module.
Nothing in it is applied anywhere. Follow these rules exactly:

- Only edit `terraform/root-modules/customer-privatelink/main.tf`.
- Add exactly one map entry per task: `endpoints` for Step 1 PRs,
  `custom_dns_name` for Step 2 PRs. Never modify or remove existing
  customers' entries.
- Match the surrounding formatting: 2-space indent, aligned `=`, one comment
  line above the entry naming the customer, team ID, and ticket ID.
- Never run terraform, tofu, or any installer. There is no state to plan
  against.
- Keep the diff minimal: no reformatting, no comment rewrites, no README
  changes.
