FactoryGirl.define do
  factory :visitor, class: Visitor do

    trait :with_data do
      name 'Alejandro'
    end

  end
end