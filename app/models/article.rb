class Article < ActiveRecord::Base

  validates :title, :presence => true,
                   :uniqueness => true,
                   :length => {:minimum => 1,:maximum => 100}

  has_many :comments, :dependent => :destroy
  belongs_to :user
  scope :rating_is_and_above, lambda {|rating| where("rating > ?", rating)}
end
