require 'rest-client'
require 'json'

def provisioning_parameters
  {"version"=>"1.1",
   "template_fields"=>
    {"guid"=>"b420edc4-e6cd-11e5-b810-000a27020066",
     "name"=>"gm-empty-template"},
   "vm_fields"=>
    {"sysprep_server_license_mode"=>"perServer",
     "sysprep_identification"=>"domain",
     "sysprep_per_server_max_connections"=>"5",
     "sysprep_workgroup_name"=>"WORKGROUP",
     "addr_mode"=>"dhcp",
     "sysprep_change_sid"=>true,
     "sysprep_auto_logon"=>true,
     "sysprep_enabled"=>"disabled",
     "sysprep_auto_logon_count"=>1,
     "placement_auto"=>true,
     "number_of_vms"=>1,
     "vm_name"=>"gm",
     "provision_type"=>"vmware",
     "vm_auto_start"=>true,
     "retirement"=>0,
     "retirement_warn"=>604800,
     "vlan"=>"VM Network",
     "disk_format"=>"unchanged",
     "cpu_limit"=>-1,
     "memory_limit"=>-1,
     "number_of_sockets"=>1,
     "cores_per_socket"=>1,
     "cpu_reserve"=>0,
     "vm_memory"=>"2048",
     "memory_reserve"=>0,
     "network_adapters"=>1,
     "diskscsi0" => "0:0:10",
     "diskscsi1" => "0:1:5"},
   "requester"=>
    {"owner_first_name"=>"g",
     "owner_last_name"=>"g",
     "owner_email"=>"gm@rh.com"},
   "tags"=>{},
   "additional_values"=>{},
   "ems_custom_attributes"=>{},
   "miq_custom_attributes"=>{}}
end

address = "localhost:3000"
result = RestClient.post "http://admin:smartvm@#{address}/api/provision_requests", provisioning_parameters.to_json
puts result
