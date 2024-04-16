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

variable "name" {
  description = "Name of the API Gateway."
  type        = string
}

variable "protocol_type" {
  description = "API protocol. Valid values: `HTTP`, `WEBSOCKET`. Defaults to `HTTP`"
  type        = string
  default     = "HTTP"
}

variable "body" {
  description = "Optional OpenAPI specification that defines the set of routes and integrations to create as part of the HTTP APIs. Supported only for HTTP APIs."
  type        = string
  default     = null
}

variable "version_identifier" {
  description = "Optional version identifier for the API. Must be between 1 and 64 characters in length."
  type        = string
  default     = null
}

variable "route_selection_expression" {
  description = "The route selection expression for the API. Defaults to `$request.method $request.path`. See https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-route-selection-expressions for more details."
  type        = string
  default     = "$request.method $request.path"
}

variable "tags" {
  description = "Map of tags to assign to the API."
  type        = map(string)
  default     = null
}
