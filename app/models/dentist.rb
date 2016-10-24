class Dentist < ActiveRecord::Base
  has_many :visits, dependent: :destroy
  has_one :work_calendar, dependent: :destroy
  validates_presence_of :visits, :work_calendar
  validates :enrollment, uniqueness: {message: 'Ya existe un odontólogo con esa matrícula'}

  def as_json(options = {})
    json = super(options)
    json[:visits] = visits.map { |v| v.as_json }
    json[:work_calendar] = work_calendar.as_json
    json
  end

end
