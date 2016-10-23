class WorkableDay < ActiveRecord::Base
  has_many :workable_hours, autosave: true, dependent: :destroy
  validates :day, presence: true, uniqueness: true
  validates_presence_of :workable_hours

  def as_json(options = {})
    json = super(options)
    json[:workable_hours] = workable_hours.map { |h| {workable_hours: h.as_json} }
    json
  end

end
