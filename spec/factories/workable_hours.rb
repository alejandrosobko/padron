FactoryGirl.define do

  factory :workable_hour_morning, class: WorkableHour do
    from 9
    to 12
  end

  factory :workable_hour_afternoon, class: WorkableHour do
    from 14
    to 18
  end

end
