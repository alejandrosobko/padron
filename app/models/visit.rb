class Visit < ActiveRecord::Base
  belongs_to :visitor
  belongs_to :dentist
  validates_presence_of :dentist, :visitor, :visit_date

  def as_json(options = {})
    super(options)
  end

end
