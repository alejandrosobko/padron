FactoryGirl.define do

  factory :visit, class: Visit do
    visit_date DateTime.now
    observations 'Some observation for this visit'
  end

end