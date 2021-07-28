resource "aws_api_gateway_rest_api" "api" {
	name = "api-gw"
}

resource "aws_api_gateway_resource" "resource" {
	parent_id = aws_api_gateway_rest_api.api.root_resource_id
	path_part = "api"
	rest_api_id = aws_api_gateway_rest_api.api.id
}

resource "aws_api_gateway_method" "method" {
	authorization = "NONE"
	http_method = "GET"
	resource_id = aws_api_gateway_resource.resource.id
	rest_api_id = aws_api_gateway_rest_api.api.id
}

resource "aws_api_gateway_integration" "integration" {
	http_method = aws_api_gateway_method.method.http_method
	resource_id = aws_api_gateway_resource.resource.id
	rest_api_id = aws_api_gateway_rest_api.api.id
	type = "AWS"
}

resource "aws_api_gateway_deployment" "deploy" {
	rest_api_id = aws_api_gateway_rest_api.api.id
	triggers = {
		redeployment = sha1(jsonencode([
			aws_api_gateway_resource.resource.id,
			aws_api_gateway_method.method.id,
			aws_api_gateway_integration.integration.id
		]))
	}
	lifecycle { 
		create_before_destroy = true
	}
}

resource "aws_api_gateway_stage" "stage" {
	deployment_id = aws_api_gateway_deployment.deploy.id
	rest_api_id = aws_api_gateway_rest_api.api.id
	stage_name = "exapmle_stage"
}
