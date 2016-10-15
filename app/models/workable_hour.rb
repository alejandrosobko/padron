class WorkableHour < ActiveRecord::Base
  validates_presence_of :from, :to

  def as_json(options = {})
    super(options)
  end

end
