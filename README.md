# Terraform
Building a highly available simple webapp with AWS and terraform from scratch
Few basic commands to use

terraform init (initialize plugins)
terraform validate (Validation of code)
terraform fmt (for proper indentation)
terraform plan -o <filename>.out (to get plan out)
terraform apply <filename>.out -auto-approve (create planned infra)
terraform destroy (destroy created infra)
TFVAR_<var-name>=<value> <terraform command>

Things which are used heavily
variabels: variables.tf
modules: reusable code sections
output: output certain objects to use in other module
providers: mention which provider you want to use and creds to do so

For AWS: populate AWS_ACCESS_KEY
                  AWS_SECRET_KEY
                  AWS_DEFAULT_REGION
