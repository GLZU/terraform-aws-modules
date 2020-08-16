locals{
	params = var.params
}

resource "tfe_variable" "variable" {
  key          = local.params.variable.key								# Name of the variable
  value        = local.params.variable.value								# value of the variable
  category     = lookup(local.params.variable, "category", "terraform")  # Setting up default to terraform unless specified
  workspace_id = local.params.variable.ws_id							# Workspace to attach to
 # hcl          = lookup(local.params.variable, "hcl", false) 
  sensative    = lookup(local.params.variable, "sensative", false) 
  description  = lookup(local.params.variable,"description","Variable")	# Description of Variable 
}
