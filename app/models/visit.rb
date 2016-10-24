class Visit < ActiveRecord::Base
  belongs_to :visitor, dependent: :destroy
  validates_presence_of :visitor, :visit_date

  def as_json(options = {})
    json = super(options)
    json[:visitor] = visitor.as_json
    json
  end

end
