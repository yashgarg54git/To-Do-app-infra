variable "nics" {
  type = map(object({
    nic_name            = string
    location            = string
    resource_group_name = string
    subnet_key           = string
    public_ip_key        = string
    nsg_key             = string                    
  }))
}

variable "subnet_ids" {
  
}
variable "public_ip_ids" {
  
}
# nsg association
variable "nsg_ids" {}

