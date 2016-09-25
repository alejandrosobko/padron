class Dentist < ActiveRecord::Base
  has_one :visit

  def as_json(options = {})
    super(options)
  end

end
