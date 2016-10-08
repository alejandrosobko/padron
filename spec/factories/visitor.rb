FactoryGirl.define do
  factory :visitor, class: Visitor do

    trait :empty do
    end

    trait :complete do
      name 'Alejandro'
    end

  end
end