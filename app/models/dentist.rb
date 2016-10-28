class Dentist < ActiveRecord::Base
  has_many :visits, dependent: :destroy
  has_one :work_calendar, dependent: :destroy, autosave: true
  validates_presence_of :visits, :work_calendar
  validates :enrollment, uniqueness: {message: 'Ya existe un odontólogo con esa matrícula'}, allow_nil: true
  accepts_nested_attributes_for :visits, :work_calendar

  def as_json(options = {})
    json = super(options)
    json[:visits] = visits.map { |v| v.as_json }
    json[:work_calendar] = work_calendar.as_json
    json
  end

end
