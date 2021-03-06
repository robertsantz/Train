class Country < ActiveRecord::Base
  has_many :users, :dependent => :destroy
  validate :name, :presence => true,
                  :length => {:minimum => 1, :maximum => 15}
  validate :valid_code
  def valid_code
    self.errors[:code] << "Only can be filled with id/usa/frc" if (code != "id" && code != "usa" && code!= "frc")
  end
end
