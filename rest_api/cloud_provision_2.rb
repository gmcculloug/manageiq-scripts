require 'rest-client'
require 'json'

def provision(address)
  RestClient.post "http://admin:smartvm@#{address}/api/provision_requests",
  {"version"=>"1.1",
   "template_fields"=>
    {"guid"=>"923b091e-7fbf-11e3-b917-c82a14fffeba",
     "name"=>"GM Empty Template I"},
   "vm_fields"=>
    {"sysprep_organization"=>"MIQ",
     "sysprep_custom_spec"=>"13",
     "sysprep_server_license_mode"=>"perServer",
     "sysprep_timezone"=>"035",
     "sysprep_product_id"=>"KTMMT-4W39B-JRJKK-KCQFF-KYR73",
     "sysprep_identification"=>"workgroup",
     "sysprep_per_server_max_connections"=>"5",
     "sysprep_workgroup_name"=>"WORKGROUP",
     "addr_mode"=>"dhcp",
     "sysprep_change_sid"=>true,
     "sysprep_auto_logon"=>true,
     "sysprep_enabled"=>"fields",
     "sysprep_full_name"=>"MIQ",
     "sysprep_auto_logon_count"=>1,
     "placement_auto"=>true,
     "number_of_vms"=>1,
     "vm_name"=>"gm_test",
     "provision_type"=>"vmware",
     "vm_auto_start"=>true,
     "retirement"=>0,
     "retirement_warn"=>604800,
     "vlan"=>"atp-portGrp",
     "disk_format"=>"unchanged",
     "cpu_limit"=>-1,
     "memory_limit"=>-1,
     "number_of_sockets"=>2,
     "cores_per_socket"=>2,
     "cpu_reserve"=>0,
     "vm_memory"=>"1024",
     "memory_reserve"=>0,
     "network_adapters"=>1},
   "requester"=>
    {"owner_first_name"=>"Greg",
     "owner_last_name"=>"McCullough",
     "owner_email"=>"gmccullo@redhat.com"},
   "tags"=>{"environment"=>"dev", "cc"=>"002"},
   "additional_values"=>nil,
   "ems_custom_attributes"=>nil,
   "miq_custom_attributes"=>nil}.to_json
end

puts provision("localhost:3000")
