class Institute < ActiveRecord::Base
  has_one :work_calendar, dependent: :destroy, autosave: true
  # validates_presence_of :work_calendar
  accepts_nested_attributes_for :work_calendar

  def as_json(options = {})
    json = super(options)
    json[:work_calendar] = work_calendar.as_json
    json
  end

end
