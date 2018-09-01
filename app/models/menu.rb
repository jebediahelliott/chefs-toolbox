class Menu < ApplicationRecord
  has_many :recipes
  belongs_to :user
end


# name
# menu has meal attributes i.e. Monday lunch, Monday dinner, etc.
# each meal has a description
# each meal has associated recipes(select recipes to associate with meal/menu)
# recipes are timestamped based on last time used in a menu
