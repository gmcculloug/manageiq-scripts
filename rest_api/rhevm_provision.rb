require 'rest-client'
require 'json'

def provision(address)
  RestClient.post "http://admin:smartvm@#{address}/api/provision_requests",
  {
    "version" => "1.1",
    "template_fields" =>
    {
      "guid" => "caa112ae-e6cd-11e5-b810-000a27020066",
      "name" => "rhel-guest-image-6"
    },
    "vm_fields" =>
    {
      "root_password"     => "v2:{I2SQ5PdmGPwN7t5goRiyaQ==}",
      "addr_mode"         => "static",
      "placement_auto"    => false,
      "number_of_vms"     => 1,
      "provision_type"    => "native_clone",
      "vm_name"           => "gm_test_$n{3}",
      "retirement"        => 0,
      "retirement_warn"   => 604800,
      "vlan"              => "rhevm",
      "disk_format"       => "default",
      "number_of_sockets" => 1,
      "cores_per_socket"  => 1,
      "vm_memory"         => "1024",
      "network_adapters"  => 1,
      "vm_auto_start"     =>  false
    },
    "requester" =>
    {
      "owner_first_name" =>"Greg",
      "owner_last_name"  =>"McCullough",
      "owner_email"      =>"gmccullo@redhat.com"
    },
   "tags"                  => {},
   "additional_values"     => nil,
   "ems_custom_attributes" => nil,
   "miq_custom_attributes" => nil
  }.to_json
end

result = provision("localhost:3000")
puts result
