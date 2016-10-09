class Dentist < ActiveRecord::Base
  has_many :visits, dependent: :destroy
  validates_presence_of :visits

  def as_json(options = {})
    super(options)
  end

end
