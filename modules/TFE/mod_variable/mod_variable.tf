locals{
	params = var.params
}
resource "tfe_variable" "test" {
  key          = local.param.variable.key								# Name of the variable
  value        = local.param.variable.value								# value of the variable
  category     = lookup(local.param.variable, "category", "terraform")  # Setting up default to terraform unless specified
  workspace_id = local.params.variable.ws_id							# Workspace to attach to
  description  = lookup(local.param.variable,"description","Variable")	# Description of Variable 
}
