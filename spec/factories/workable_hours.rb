FactoryGirl.define do

  factory :workable_hour_morning, class: WorkableHour do
    from '09:30'
    to '12:00'
  end

  factory :workable_hour_afternoon, class: WorkableHour do
    from '14:00'
    to '18:00'
  end

end
