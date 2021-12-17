variable "subscriptionIdK8s1"{
    default = "0f3f52cf-8807-4542-a99e-74ca0b12361d"
}

variable "locationK8s1"{
    default = "eastus"
}

variable "resourceGpK8s1"{
    default = "recursoasabc"
}

variable "client_id_K8s1" {
    default = "858e73ff-2a0a-40a2-a8d6-cb2de4b72e8c"
}

variable "client_secret_K8s1" {
    default = "p4S7Q~2imy1Dh-nNbyDTJYqCkQTp3fEDemtEe"
}

variable "agent_count_k8s1" {
    default = 1
}

variable "ssh_public_key_k8s1" {
    default = "aksprodsshkey.pub"
}

variable "dns_prefix_k8s1" {
    default = "k8stest"
}

variable "cluster_name_k8s1" {
    default = "K8s1"
}

variable "log_analytics_workspace_name_k8s1" {
    default = "terraformcluster"
}

variable "log_analytics_workspace_location_k8s1" {
    default = "eastus"
}

variable "log_analytics_workspace_sku_k8s1" {
    default = "PerGB2018"
}

variable "VmSizeK8s1"{
    default = "Standard_D2_v2"
}

variable "loadbalancersku_k8s1"{
    default = "Standard"
}

variable "netwplugin_k8s1"{
    default = "kubenet"
}

variable "envTag_k8s1"{
    default = "Cluster_Sub_1"
}

variable "nodePool_k8s1"{
    default = "agentpool"
}


/*
variable "vnetsubnetid_k8s1"{
    default = data.azurerm_subnet.collect_subnet[each.value["data_source_subnet_id"]].id
}
*/
variable "networkpolicy_k8s1"{
    default = "calico"
}

variable "dockerCidr_k8s1"{
    default = "172.17.0.1/16"
}

variable "serviceCidr_k8s1"{
    default = "192.168.0.0/16"
}

variable "dnsServiceIp_k8s1"{
    default = "192.168.0.10"
}