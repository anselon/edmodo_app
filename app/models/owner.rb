class Owner < ActiveRecord::Base
  validates_uniqueness_of :edmodo_id
end
