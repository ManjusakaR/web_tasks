require 'sinatra'
require 'active_record'
require 'mysql2'

ActiveRecord::Base.establish_connection(
  :adapter => "mysql2",
  :host  =>  "localhost",
  :database => "blog",
  :username => "root",
  :password => "wangrui"
)

class User < ActiveRecord::Base
  has_one :message
  validates :username, :password, presence: true
  validates :username, uniqueness: true
end

class Message < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true, length: { minimum: 10 }
end
