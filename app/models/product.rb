class Product < ActiveRecord::Base
  belongs_to :owner
  has_many :flags
  
  accepts_nested_attributes_for :flags
  #, reject_if: proc { |attributes| attributes['reason'].blank? }
  
  searchable do
    string :title 
    text :long_desc_html
  end
end
