require 'sinatra'
require 'aws-record'
require_relative './models/gratitude'

get '/' do
  erb :index
end

get '/thx/:id' do
end



# Create gratitude holder
post '/api/gratitude' do
  content_type :json

  gratitude = Gratitude.new(id: SecureRandom.uuid, created_at: Time.now, count: 0)
  #gratitude.save!

  gratitude.as_json.to_json
end
