class WorkCalendar < ActiveRecord::Base
  has_many :workable_days, autosave: true, dependent: :destroy

  def as_json(options = {})
    json = super(options)
    json[:workable_days] = workable_days.map { |d| d.as_json }
    json
  end

end
