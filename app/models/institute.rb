class Institute < ActiveRecord::Base

  def as_json(options = {})
     super(options)
  end

end
