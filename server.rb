require 'rubygems'
require 'crisp'

crisp_client = Crisp::Client.new
crisp_client.set_tier("plugin")
crisp_client.set_credentials(ENV['CRISP_IDENTIFIER'], ENV['CRISP_KEY'])

crisp_client.on "message:send" do |message|
  puts message
  RestClient::Request.execute(
    url: "#{ENV['BASE_URL']}/konexta/crisp/messages", # Change to app URL if you need to test it
    method: :post,
    payload: message
  )
end

loop do
end