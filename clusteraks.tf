resource "azurerm_resource_group" "k8s1" {
    name     = var.resourceGpK8s1
    location = var.locationK8s1
}

resource "random_id" "log_analytics_workspace_name_suffix_k8s1" {
    byte_length = 8
}

resource "azurerm_log_analytics_workspace" "workspace_k8s1" {
    # The WorkSpace name has to be unique across the whole of azure, not just the current subscription/tenant.
    name                = "${var.log_analytics_workspace_name}-${random_id.log_analytics_workspace_name_suffix_k8s1.dec}"
    location            = var.log_analytics_workspace_location
    resource_group_name = azurerm_resource_group.k8s1.name
    sku                 = var.log_analytics_workspace_sku
}

resource "azurerm_log_analytics_solution" "solution_k8s1" {
    solution_name         = "ContainerInsights"
    location              = azurerm_log_analytics_workspace.workspace_k8s1.location
    resource_group_name   = azurerm_resource_group.k8s1.name
    workspace_resource_id = azurerm_log_analytics_workspace.workspace_k8s1.id
    workspace_name        = azurerm_log_analytics_workspace.workspace_k8s1.name

    plan {
        publisher = "Microsoft"
        product   = "OMSGallery/ContainerInsights"
    }
}

resource "azurerm_kubernetes_cluster" "k8s1" {
    name                = var.cluster_name_k8s1
    location            = var.locationK8s1
    resource_group_name = var.resourceGpK8s1
    dns_prefix          = var.dns_prefix_k8s1

    linux_profile {
        admin_username = "ubuntu"
        ssh_key {
            key_data = file(var.ssh_public_key_k8s1)
        }
    }

    default_node_pool {
        name            = var.nodePool_k8s1
        node_count      = var.agent_count_k8s1
        vm_size         = var.VmSizeK8s1
        #vnet_subnet_id = var.vnetsubnetid_k8s1
    }

    service_principal {
        client_id     = var.client_id_K8s1
        client_secret = var.client_secret_K8s1
    }

    addon_profile {
        oms_agent {
        enabled                    = true
        log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace_k8s1.id
        }
    }

    network_profile {
        load_balancer_sku = var.loadbalancersku_k8s1
        network_plugin = var.netwplugin_k8s1
        network_policy = var.networkpolicy_k8s1
        docker_bridge_cidr = var.dockerCidr_k8s1
        service_cidr = var.serviceCidr_k8s1
        dns_service_ip = var.dnsServiceIp_k8s1
    }

    tags = {
        Environment = var.envTag_k8s1
    }
}