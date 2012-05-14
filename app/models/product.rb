class Product < ActiveRecord::Base
  validates :name, :presence => true
  belongs_to :user
  has_many :categories, :through => :categories_products
  has_many :categories_products
  scope :price_more_than_1000, where("price > 1000")
end
