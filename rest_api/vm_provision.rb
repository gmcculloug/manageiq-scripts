require 'rest-client'
require 'json'

def provision(address)
  RestClient.post "http://admin:smartvm@#{address}/api/provision_requests",
                  {
                    "version"               => "1.1",
                    "template_fields"       => {
                      "guid"                => "923b091e-7fbf-11e3-b917-c82a14fffeba"
                    },
                    "vm_fields"             => {
                      "number_of_cpus" => 1,
                      "vm_name"        => "gmm_test_001",
                      "vm_memory"      => "1024",
                      "vlan"           => "nic1",
                      "placement_auto" => [false, 0],
                    },
                    "requester"             => {
                      "user_name"        => "admin",
                      "owner_first_name" => "John",
                      "owner_last_name"  => "Doe",
                      "owner_email"      => "jdoe@sample.com",
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

result = provision("localhost:3000")
puts result
