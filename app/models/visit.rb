class Visit < ActiveRecord::Base
  belongs_to :visitor, dependent: :destroy
  validates_presence_of :visitor, :visit_date

  def as_json(options = {})
    super(options)
  end

end
