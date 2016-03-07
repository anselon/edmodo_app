class Owner < ActiveRecord::Base
  has_many :products
  validates_uniqueness_of :edmodo_id
end
