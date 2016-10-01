class Visitor < ActiveRecord::Base
  validates :name, length: { minimum: 2 }

  def as_json(options = {})
    super(options)
  end

end
