require 'rest-client'
require 'json'

def provision(address)
  RestClient.post "http://admin:smartvm@#{address}/api/provision_requests",
                  {
                    "version"               => "1.1",
                    "template_fields"       => {
                      "guid"                => "83de4540-0362-11e3-ba23-c82a14fffeba"  # Amazon: "test-linux"
                      # "guid"                => "1f082620-3dec-11e4-819a-6003089fa294"  # Openstack: "test-linux"
                    },
                    "vm_fields"             => {
                      "vm_name"                     => "gmm_test",
                      "placement_auto"              => "true",
                      "placement_availability_zone" => "2",         # us-east-1b
                      "cloud_network"               => "2",         # vpc-d7b9b2b5 (10.1.0.0/16)
                      "cloud_subnet"                => "3",         # subnet-ac507ad8 (10.1.0.0/28) | us-east-1b
                      "security_groups"             => "64",        # 'default: default VPC security group'
                      "floating_ip_address"         => "4",         # 54.208.121.144
                      "instance_type"               => "2",         # 'm1.small: M1 General Purpose Small'
                      "guest_access_key_pair"       => "65",        # gm
                      "monitoring"                  => "basic",
                      "root_password"               => "v2:{I2SQ5PdmGPwN7t5goRiyaQ==}"
                    },
                    "requester"             => {
                      "owner_first_name" => "Greg",
                      "owner_last_name"  => "McCullough",
                      "owner_email"      => "gmccullo@redhat.com",
                      "auto_approve"     => true
                    },
                    "tags"                  => {
                      "network_location" => "Internal",
                      "cc"               => "001"
                    },
                    "additional_values"     => {
                      "request_id" => "1001"
                    },
                    "ems_custom_attributes" => {},
                    "miq_custom_attributes" => {}
                  }.to_json
end

begin
  result = provision("localhost:3000")
  puts result
rescue
  puts $!.inspect
end
