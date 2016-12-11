class Dentist < ActiveRecord::Base
  has_many :historic_dentists
  has_many :visits, dependent: :destroy
  has_many :institutes, dependent: :destroy
  validates_presence_of :visits
  validates :enrollment, uniqueness: {message: 'Ya existe un odontólogo con esa matrícula'}, allow_nil: true
  accepts_nested_attributes_for :visits, :institutes
  serialize :emails, Array
  serialize :telephones, Array
  serialize :cellphones, Array

  before_update :save_historic

  def as_json(options = {})
    json = super(options)
    json[:visits]        = visits.map { |v| v.as_json }
    json[:institutes]    = institutes.map { |i| i.as_json }
    json
  end

  private

  def save_historic
    historic_dentists << HistoricDentist.create!({version: self.version, modification_time: Time.zone.now, dentist_id: id})
    self.version += 1
  end

end
