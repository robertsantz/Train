class Article < ActiveRecord::Base
  validate :title, :presence => true,
                   :uniqueness => true
  has_many :comments, :dependent => :destroy
  belongs_to :user
  scope :rating_is_and_above, lambda {|rating| where("rating > ?", rating)}
end
