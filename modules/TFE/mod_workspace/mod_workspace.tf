locals {  
  params = var.params
}
/*
resource "tfe_workspace" "ws" {
  name         = local.params.ws.tf_workspace_name
  organization = local.params.ws.tf_org
   working_directory  =     local.params.ws.git_path 
  vcs_repo {
     identifier     = "${local.params.git.target_git_org}/${local.params.git.target_repo_name}"
#     branch         = local.params.git.repo_name
     oauth_token_id =  local.params.ws.vcs_oauth_token_id
  }
}*/

module "workspace" {
  count = length(local.params.ws.variables)
  source = "../mod_variable"
  params =  { variable = merge(local.params.ws.variables[count.index], {ws_id = tfe_workspace.ws.id}) }
  depends_on = [tfe_workspace.ws]
}
