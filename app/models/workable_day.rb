class WorkableDay < ActiveRecord::Base
  has_many :workable_hours, dependent: :destroy
  validates_presence_of :day, :workable_hours
  serialize :workable_hours

  def as_json(options = {})
    workable_hours.map { |h| {workable_hours: h.as_json} }.first.merge(super(options))
  end

end
