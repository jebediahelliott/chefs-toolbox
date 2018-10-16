class User < ApplicationRecord
  has_many :recipes
  has_many :menus
  has_secure_password
  validates :name, presence: true, uniqueness: true
  # validates :password, presence: true
end
