class User < ApplicationRecord
  has_many :recipes
  has_many :inventories
  has_secure_password 
end
