variable "rgs" {
    type = map(object({
      resource_group_name = string
      location = string
    }))
  
}

variable "vnets" {
    type = map(object({

    vnet_name           = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    
    }))
  
}

variable "subnets" {
    type = map(object({
      subnet_name = string
      resource_group_name = string
      vnet_name = string
      address_prefixes = list(string)
    }))
  
}

variable "public_ips" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    sku                 = string
  }))
}

variable "nics" {
  type = map(object({
    nic_name            = string
    location            = string
    resource_group_name = string
    subnet_key           = string
    public_ip_key        = string
    nsg_key = string
  }))
}

variable "nsgs" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}


variable "vms" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    size                 = string
    admin_username       = string
    admin_password       = string
    nic_key              = string
  }))
}



