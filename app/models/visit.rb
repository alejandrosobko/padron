class Visit < ActiveRecord::Base
  has_one :visitor
  has_one :dentist
  validates_presence_of :dentist, :visitor, :visit_date

  def as_json(options = {})
    super(options)
  end

end
