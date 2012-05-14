class User < ActiveRecord::Base
  validates :first_name, :presence => true,
                         :length => {:minimum => 1, :maximum => 20},
                         :format => {:with => /[a-zA-Z\s]+$/}
  validates :last_name, :presence => true,
                        :length => {:minimum => 1, :maximum => 20},
                        :format => {:with => /[a-zA-Z\s]+$/}
  validates :email, :presence => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i},
                    :uniqueness => true
  validates :username, :presence => true,
                      :format => {:with => /[a-z0-9\s]+$/},
                      :uniqueness => true
  has_many :products, :dependent => :destroy
  has_many :articles, :dependent => :destroy
  belongs_to :country
  has_many :shared_articles, :class_name => "Article", 
                             :foreign_key => "user_id",
                             :conditions => "title like '%share%'"


  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
