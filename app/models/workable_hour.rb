class WorkableHour < ActiveRecord::Base
  validates_numericality_of :from, greater_than_or_equal_to: 0, less_than_or_equal_to: 24, presence: true, message: 'El horario es incorrecto'
  validates_numericality_of :to, greater_than: :from, less_than_or_equal_to: 24, presence: true, message: 'El horario es incorrecto'

  def as_json(options = {})
    super(options)
  end

end
