require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  has_secure_password

  validates_presence_of :password, :on => :create

  has_many :articles
  has_many :comments
end
