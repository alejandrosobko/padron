class WorkableDay < ActiveRecord::Base
  has_many :workable_hours, autosave: true, dependent: :destroy
  validates_presence_of :workable_hours, :day

  def as_json(options = {})
    json = super(options)
    json[:workable_hours] = workable_hours.map { |h| h.as_json }
    json
  end

end
