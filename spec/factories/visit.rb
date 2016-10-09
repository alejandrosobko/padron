FactoryGirl.define do
  factory :visit, class: Visit do

    trait :empty do
    end

    trait :complete do
      visit_date DateTime.now.utc
      observations 'Some observation for this visit'
    end

  end
end