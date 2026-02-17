module "rgm" {
    source = "./modules/01-resource_group"
    rgs = var.rgs
  
}

module "vnetm" {
    source = "./modules/02-virtual_network"
    vnets = var.vnets
    depends_on = [ module.rgm ]
  
}

module "snetm" {
    source = "./modules/03-subnet"
    subnets = var.subnets
    depends_on = [ module.vnetm ]
  
}

module "pipm" {
    source = "./modules/04-public_ip"
    public_ips = var.public_ips
    depends_on = [ module.snetm ]
  
}

module "nsgm" {
  source = "./modules/07-NSG"
  nsgs   = var.nsgs
  
}

module "nicm" {
    source = "./modules/05_NIC"
    nics = var.nics
    subnet_ids    = module.snetm.subnet_ids
    public_ip_ids = module.pipm.public_ip_ids
    nsg_ids       = module.nsgm.nsg_ids
    
  
}



module "vmm" {
  source  = "./modules/06-virtual_machine"
  vms     = var.vms
  nic_ids = module.nicm.nic_ids
  
}
