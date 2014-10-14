class Org < ActiveRecord::Base

  has_many :deals
  has_many :permissions

end
