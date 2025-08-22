# FortiGate Standalone VM
# Terraform deployment for Microsoft Azure with existing Resource Group

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">4.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "azurerm" {
  features {}
}

variable "username" {
  description = "Username for the FortiGate VM"
  type        = string
}

variable "flexentitlementtoken" {
  description = "FortiFlex Entitlement Token"
  type        = string
}

locals {

  resource_group_name     = "${var.username}-flex105-workshop"
  resource_group_location = "eastus"

  prefix = "tf"

  username = var.username
  password = "changeme123#@!"

  # Either one of these can be used to license to the BYOL FortiGate
  fortigate_byol_license_file  = "" # Change this to your own license filename, can be uploaded after deployment
  fortigate_byol_license_token = var.flexentitlementtoken
}

# Generate random string for FortiGate API key
resource "random_string" "string" {
  length  = 30
  special = false
}

# Create Public IP address if enabled in locals
resource "azurerm_public_ip" "public_ip" {

  resource_group_name = local.resource_group_name
  location            = local.resource_group_location
  name                = "${local.prefix}-fgt-pip"
  allocation_method   = "Static"
  sku                 = "Standard"
}

# Create Virtual Network and subnets
resource "azurerm_virtual_network" "virtual_network" {
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location

  name          = "${local.prefix}-fgt-vnet"
  address_space = ["10.50.0.0/16"]
}

resource "azurerm_subnet" "external" {
  resource_group_name = local.resource_group_name

  name                 = "snet-external"
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = ["10.50.0.0/24"]
}

resource "azurerm_subnet" "internal" {
  resource_group_name = local.resource_group_name

  name                 = "snet-internal"
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = ["10.50.1.0/24"]
}

# Create Network Interfaces
resource "azurerm_network_interface" "network_interface_ext" {
  resource_group_name            = local.resource_group_name
  location                       = local.resource_group_location
  name                           = "${local.prefix}-fgt-ext-nic"
  ip_forwarding_enabled          = true
  accelerated_networking_enabled = false

  ip_configuration {
    name                          = "ipconfig1"
    primary                       = true
    subnet_id                     = azurerm_subnet.external.id
    private_ip_address_allocation = "Static"
    private_ip_address            = cidrhost(azurerm_subnet.external.address_prefixes[0], 4)
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_network_interface" "network_interface_int" {
  resource_group_name            = local.resource_group_name
  location                       = local.resource_group_location
  name                           = "${local.prefix}-fgt-int-nic"
  ip_forwarding_enabled          = true
  accelerated_networking_enabled = false

  ip_configuration {
    name                          = "ipconfig1"
    primary                       = true
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Static"
    private_ip_address            = cidrhost(azurerm_subnet.internal.address_prefixes[0], 4)
  }
}

resource "azurerm_network_security_group" "network_security_group" {

  resource_group_name = local.resource_group_name
  location            = local.resource_group_location

  name = "${local.prefix}-fgt-nsg"
}

resource "azurerm_subnet_network_security_group_association" "subnet_network_security_group_association_external" {
  subnet_id                 = azurerm_subnet.external.id
  network_security_group_id = azurerm_network_security_group.network_security_group.id
}

resource "azurerm_subnet_network_security_group_association" "subnet_network_security_group_association_internal" {
  subnet_id                 = azurerm_subnet.internal.id
  network_security_group_id = azurerm_network_security_group.network_security_group.id
}

resource "azurerm_network_security_rule" "network_security_rule_egress" {

  resource_group_name = local.resource_group_name

  name = "Allow-Internet-Egress"

  network_security_group_name = azurerm_network_security_group.network_security_group.name
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "network_security_rule_ingress" {

  resource_group_name = local.resource_group_name

  name = "Allow-Internet-Ingress"

  network_security_group_name = azurerm_network_security_group.network_security_group.name
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}

resource "azurerm_linux_virtual_machine" "linux_virtual_machine_fgtvm" {
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location

  name                  = "${local.prefix}-fgt-vm"
  network_interface_ids = [azurerm_network_interface.network_interface_ext.id, azurerm_network_interface.network_interface_int.id]
  size                  = "Standard_F2s_v2"

  identity {
    type = "SystemAssigned"
  }

  source_image_reference {
    publisher = "fortinet"
    offer     = "fortinet_fortigate-vm_v5"
    sku       = "fortinet_fg-vm"
    version   = "latest"
  }

  plan {
    publisher = "fortinet"
    product   = "fortinet_fortigate-vm_v5"
    name      = "fortinet_fg-vm"
  }

  os_disk {
    name                 = "${local.prefix}-fgt-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_username = local.username
  admin_password = local.password

  disable_password_authentication = false

  custom_data = base64encode(templatefile("${path.module}/fortios_config.tpl", {
    fgt_vm_name           = "${local.prefix}-fgt-vm"
    fgt_license_file      = local.fortigate_byol_license_file
    fgt_license_fortiflex = local.fortigate_byol_license_token
    fgt_username          = local.username
    fgt_ssh_public_key    = ""
    api_key               = random_string.string.id
    fgt_external_ipaddr   = cidrhost(tolist(azurerm_subnet.external.address_prefixes)[0], 4)
    fgt_external_mask     = cidrnetmask(tolist(azurerm_subnet.external.address_prefixes)[0])
    fgt_external_gw       = cidrhost(tolist(azurerm_subnet.external.address_prefixes)[0], 1)
    fgt_internal_ipaddr   = cidrhost(tolist(azurerm_subnet.internal.address_prefixes)[0], 4)
    fgt_internal_mask     = cidrnetmask(tolist(azurerm_subnet.internal.address_prefixes)[0])
    fgt_internal_gw       = cidrhost(tolist(azurerm_subnet.internal.address_prefixes)[0], 1)
    vnet_network          = tolist(azurerm_virtual_network.virtual_network.address_space)[0]
  }))

  boot_diagnostics {
  }

}

resource "azurerm_managed_disk" "managed_disk" {
  resource_group_name  = local.resource_group_name
  location             = local.resource_group_location
  name                 = "${local.prefix}-fgt-disk"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 50
}

resource "azurerm_virtual_machine_data_disk_attachment" "virtual_machine_data_disk_attachment" {
  managed_disk_id    = azurerm_managed_disk.managed_disk.id
  virtual_machine_id = azurerm_linux_virtual_machine.linux_virtual_machine_fgtvm.id
  lun                = 0
  caching            = "ReadWrite"
}

resource "local_sensitive_file" "template_file" {

  filename = "fortios_config.cfg"
  content = templatefile("${path.module}/fortios_config.tpl", {
    fgt_vm_name           = "${local.prefix}-fgt-vm"
    fgt_license_file      = local.fortigate_byol_license_file
    fgt_license_fortiflex = local.fortigate_byol_license_token
    fgt_username          = local.username
    fgt_ssh_public_key    = ""
    api_key               = random_string.string.id
    fgt_external_ipaddr   = cidrhost(tolist(azurerm_subnet.external.address_prefixes)[0], 4)
    fgt_external_mask     = cidrnetmask(tolist(azurerm_subnet.external.address_prefixes)[0])
    fgt_external_gw       = cidrhost(tolist(azurerm_subnet.external.address_prefixes)[0], 1)
    fgt_internal_ipaddr   = cidrhost(tolist(azurerm_subnet.internal.address_prefixes)[0], 4)
    fgt_internal_mask     = cidrnetmask(tolist(azurerm_subnet.internal.address_prefixes)[0])
    fgt_internal_gw       = cidrhost(tolist(azurerm_subnet.internal.address_prefixes)[0], 1)
    vnet_network          = tolist(azurerm_virtual_network.virtual_network.address_space)[0]
  })
}

output "deployment_summary" {
  value = templatefile("${path.module}/output.tpl", {
    resource_group_name        = local.resource_group_name
    location                   = local.resource_group_location
    username                   = local.username
    fgt_private_ip_address_ext = azurerm_network_interface.network_interface_ext.private_ip_address
    fgt_private_ip_address_int = azurerm_network_interface.network_interface_int.private_ip_address
    fgt_api_key                = random_string.string.id
    fgt_public_ip_address      = format("https://%s", azurerm_public_ip.public_ip.ip_address)
  })
}