class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password
#  validates :first_name, :presence => true,
#                         :length => {:minimum => 1, :maximum => 20},
#                         :format => {:with => /[a-zA-Z\s]+$/}
#  validates :last_name, :presence => true,
#                        :length => {:minimum => 1, :maximum => 20},
#                        :format => {:with => /[a-zA-Z\s]+$/}
  validates :password, :presence => {:on => :create},
                       :confirmation => true
  validates :email, :presence => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i},
                    :uniqueness => true
#  validates :username, :presence => true,
#                      :format => {:with => /[a-z0-9\s]+$/},
#                      :uniqueness => true
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  has_many :products, :dependent => :destroy
  has_many :articles, :dependent => :destroy
  belongs_to :country
  has_many :shared_articles, :class_name => "Article", 
                             :foreign_key => "user_id",
                             :conditions => "title like '%share%'"


  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def is_admin?
    self.email == "robertsantz@gmail.com"
  end
end
