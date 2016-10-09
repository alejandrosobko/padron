FactoryGirl.define do
  factory :visit, class: Visit do
    visit_date DateTime.now

    trait :with_data do
      observations 'Some observation for this visit'
    end

  end
end