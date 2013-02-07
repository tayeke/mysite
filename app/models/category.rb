class Category < ActiveRecord::Base
  attr_accessible :caption, :icon, :name, :title, :slug
  has_attached_file :icon
end
