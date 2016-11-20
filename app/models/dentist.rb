class Dentist < ActiveRecord::Base
  has_many :historic_dentists
  has_many :visits, dependent: :destroy
  has_many :institutes, dependent: :destroy
  has_one :work_calendar, dependent: :destroy, autosave: true
  validates_presence_of :visits, :work_calendar
  validates :enrollment, uniqueness: {message: 'Ya existe un odontólogo con esa matrícula'}, allow_nil: true
  accepts_nested_attributes_for :visits, :institutes, :work_calendar
  serialize :emails, Array
  serialize :telephones, Array
  serialize :cellphones, Array

  before_update :save_historic

  def as_json(options = {})
    json = super(options)
    json[:visits]        = visits.map { |v| v.as_json }
    json[:institutes]    = institutes.map { |i| i.as_json }
    json[:work_calendar] = work_calendar.as_json
    json
  end

  private

  def save_historic
    self.version += 1
    historic_dentists << HistoricDentist.create!({version: self.version, modification_time: Time.now, dentist_id: id})
  end

end
