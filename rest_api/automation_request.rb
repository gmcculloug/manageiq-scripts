require 'rest-client'
require 'json'

def provision(address, protocol = :https)
    RestClient.post "#{protocol}://admin:smartvm@#{address}/api/automation_requests",
                    {
                      'version'    => '1.1',
                      'uri_parts'  => {'namespace' => 'System',
                                       'class'     => 'Process',
                                       'instance'  => 'Request',
                                       'message'   => 'create'},
                      'parameters' => {'request' => 'InspectMe', 'key1' => 'value1', 'key2' => 'value2'}, # {'miq_zone' => 'Test'},
                      'requester'  => {'auto_approve' => 'true'}
                    }.to_json
end

result = provision("localhost:3000", :http)
puts result
