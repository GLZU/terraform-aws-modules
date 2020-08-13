locals {  
  params = var.params
}
provider github {
  alias = "github1"
}
provider tfe {
  alias = "tfe1"
} 

# Add a user to the organization
module "create_git_repo" {
  source = "../../GIT/mod_git"
  params = local.params
  providers = {
    github = github.github1
  }
}

module "workspace" {
  count = length(local.params.tfe.workspaces)
  source = "../../TFE/mod_workspace"
  providers = {
    tfe = tfe.tfe1
  }
  params = { git = local.params.git , ws = local.params.tfe.workspaces[count.index] }
  depends_on = [module.create_git_repo]
}
