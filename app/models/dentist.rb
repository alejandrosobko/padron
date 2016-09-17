class Dentist < ActiveRecord::Base
  belongs_to :visit

  def as_json(options = {})
    super(options)
  end

end
