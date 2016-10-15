class Dentist < ActiveRecord::Base
  has_many :visits, dependent: :destroy
  has_one :work_calendar, dependent: :destroy
  validates_presence_of :visits, :work_calendar

  def as_json(options = {})
    super(options)
  end

end
