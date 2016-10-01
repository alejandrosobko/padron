class Visitor < ActiveRecord::Base

  def as_json(options = {})
    super(options)
  end

end
