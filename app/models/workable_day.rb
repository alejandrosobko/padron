class WorkableDay < ActiveRecord::Base
  has_many :workable_hours, autosave: true
  validates_presence_of :day, :workable_hours

  def as_json(options = {})
    json = super(options)
    json[:workable_hours] = workable_hours.map { |h| {workable_hours: h.as_json} }
    json
  end

end
