class Comment < ActiveRecord::Base
  belongs_to :article
  validates :content, :length => {:minimum => 1, :maximum => 1024}
end
