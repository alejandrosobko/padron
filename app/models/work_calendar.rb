class WorkCalendar < ActiveRecord::Base
  has_many :workable_days, dependent: :destroy

  def as_json(options = {})
    workable_days.map { |d| {workable_days: d.as_json} }.first.merge(super(options))
  end

end
