class WorkableHour < ActiveRecord::Base
  validates :from, presence: {message: 'El horario es requerido'}, format: {with: /\A([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]\z/}
  validates :to, presence: {message: 'El horario es requerido'}, format: {with: /\A([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]\z/}
  before_save :validate_hours

  def as_json(options = {})
    super(options)
  end


  private

  def validate_hours
    if from.match(/\A([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]\z/) && to.match(/\A([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]\z/)
      DateTime.parse("2000-01-01-#{from}") < DateTime.parse("2000-01-01-#{to}")
    else
      false
    end
  end

end
