class Visit < ActiveRecord::Base
  belongs_to :visitor
  belongs_to :dentist
  validates_presence_of :visitor, :dentist, :visit_date

  def as_json(options = {})
    super(options)
  end

end
