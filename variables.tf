/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

###############################################################################
#                                zone variables                               #
###############################################################################

variable "domain" {
  description = "Zone domain, must end with a period."
  type        = string
}

variable "name" {
  description = "Zone name, must be unique within the project."
  type        = string
}

variable "private_visibility_config_networks" {
  description = "List of VPC self links that can see this zone."
  default     = []
  type        = list(string)
}

variable "project_id" {
  description = "Project id for the zone."
  type        = string
}

variable "target_name_server_addresses" {
  description = "List of target name servers for forwarding zone."
  default     = []
  type        = list(string)
}

variable "target_network" {
  description = "Peering network."
  default     = ""
}

variable "description" {
  description = "domain description ( shown in console )"
  default     = "domain managed by Terraform"
  type        = string
}

variable "type" {
  description = "Type of zone to create, valid values are 'public', 'private', 'forwarding', 'peering'."
  default     = "private"
  type        = string
}

variable "dnssec_config" {
  description = "A dnssec_config, please see https://www.terraform.io/docs/providers/google/r/dns_managed_zone.html#dnssec_config"
  type        = any
  default     = {}
}

variable "default_key_specs_key" {
  type    = any
  default = {}
}

variable "default_key_specs_zone" {
  type    = any
  default = {}
}


###############################################################################
#                               record variables                              #
###############################################################################

variable "recordsets" {
  type = list(object({
    name    = string
    type    = string
    ttl     = number
    records = list(string)
  }))
  description = "List of DNS record objects to manage, in the standard terraform dns structure."
  default     = []
}
