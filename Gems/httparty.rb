system 'cls'
require 'rubygems'
require 'httparty'

class Users
  include HTTParty
  base_uri 'https://udemy-api.herokuapp.com/'

  def rails_users
    self.class.get("/users.json")
  end
end

data = Users.new()

puts data.rails_users