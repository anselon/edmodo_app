class Flag < ActiveRecord::Base
  belongs_to :product
  
  REASONS = ['Inappropriate', 'Not helpful','Wrong tags','Spam']

  validates_inclusion_of :reason, :in => REASONS,
                         :message => "%{value} must be included in #{REASONS.join(',')}"


  def valid_reasons
    REASONS
  end


end
