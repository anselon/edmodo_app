class Product < ActiveRecord::Base
  belongs_to :owner
  has_many :flags
  
  accepts_nested_attributes_for :flags, reject_if: proc { |attributes| attributes['reason'].blank? }
  validates_uniqueness_of :edmodo_url

  searchable do
    string :title 
    text :long_desc_html
  end

  def full_url
    "https://spotlight.edmodo.com/product/#{self.edmodo_url}" 
  end

end
