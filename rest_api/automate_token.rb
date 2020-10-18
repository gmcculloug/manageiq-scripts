require 'httpclient'
require 'json'

http = HTTPClient.new
uri = "http://localhost:3000/api/service_catalogs/3/service_templates"
http.set_auth(uri, 'admin', 'smartvm')
http.www_auth.basic_auth.challenge(uri)
headers = { "Content-Type" => "application/json", "Accept" => "application/json,version=2" }

content = {
  :action => "order",
  :resource => {
    :href => "http://localhost:3000/api/service_catalogs/3/service_templates/34",
    :add_disk_continue => 'true',
  },
  :requester => {
    :user_name => 'admin',
    :auto_approve => true
  },
}

puts JSON.pretty_generate(JSON.parse(http.post(uri, content.to_json, headers).content))

===================================================

url = "http://localhost:3000/api/hosts"
options = {:method => :get,
:url => url,
:headers => {'X-Auth-Token' => MIQ_API_TOKEN}}

body = RestClient::Request.new(options).execute.body
JSON.parse(body)
