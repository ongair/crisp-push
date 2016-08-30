require 'rubygems'
require 'crisp'

crisp_client = Crisp::Client.new
crisp_client.set_tier("plugin")
crisp_client.set_credentials(ENV['CRISP_IDENTIFIER'], ENV['CRISP_KEY'])

crisp_client.on "message:send" do |message|
  puts message
  RestClient::Request.execute(
    url: "#{ENV['BASE_URL']}/konexta/crisp/messages",
    method: :post,
    payload: message
  )
end

crisp_client.on "session:set_email" do |user|
  puts user
  RestClient::Request.execute(
    url: "#{ENV['BASE_URL']}/konexta/users/#{user['session_id']}",
    method: :put,
    payload: {'user[email]' => user['email'], 'user[user_type]' => 'Crisp'}
  )
end

crisp_client.on "session:set_nickname" do |user|
  puts user
  RestClient::Request.execute(
    url: "#{ENV['BASE_URL']}/konexta/users/#{user['session_id']}",
    method: :put,
    payload: {'user[name]' => user['nickname'], 'user[user_type]' => 'Crisp'}
  )
end

crisp_client.on "message:acknowledge:delivered" do |message|
  puts message
  RestClient::Request.execute(
    url: "#{ENV['BASE_URL']}/konexta/crisp/receipts",
    method: :post,
    payload: message
  )
end

loop do
end