// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

output "api_gateway_id" {
  description = "API Identifier"
  value       = aws_apigatewayv2_api.api_gateway.id
}

output "api_endpoint" {
  description = "URI of the API, of the form `https://{api-id}.execute-api.{region}.amazonaws.com` for HTTP APIs and `wss://{api-id}.execute-api.{region}.amazonaws.com` for WebSocket APIs."
  value       = aws_apigatewayv2_api.api_gateway.api_endpoint
}

output "arn" {
  description = "ARN of the API"
  value       = aws_apigatewayv2_api.api_gateway.arn
}

output "execution_arn" {
  description = "ARN prefix to be used in an `aws_lambda_permission`'s `source_arn` attribute or in an `aws_iam_policy` to authorize access to the @connections API. See https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-control-access-iam.html for details."
  value       = aws_apigatewayv2_api.api_gateway.execution_arn
}

output "api_protocol_type" {
  description = "API protocol."
  value       = var.protocol_type
}
