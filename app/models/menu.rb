class Menu < ApplicationRecord
  has_many :meals
end


# name
# menu has meal attributes i.e. Monday lunch, Monday dinner, etc.
# each meal has a description
# each meal has associated recipes
# recipes are timestamped based on last time used in a menu
