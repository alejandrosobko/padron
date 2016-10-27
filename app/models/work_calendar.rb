class WorkCalendar < ActiveRecord::Base
  has_many :workable_days, autosave: true, dependent: :destroy
  accepts_nested_attributes_for :workable_days

  before_save :check_existing_days

  def as_json(options = {})
    json = super(options)
    json[:workable_days] = workable_days.map { |d| d.as_json } || []
    json
  end


  private

  def check_existing_days
    days = workable_days.map(&:day)
    raise 'Repeated days' if days.detect { |d| days.count(d) > 1 }
  end

end
