class WorkableHour < ActiveRecord::Base
  validates_numericality_of :to, :greater_than => :from, presence: true

  def as_json(options = {})
    super(options)
  end

end
