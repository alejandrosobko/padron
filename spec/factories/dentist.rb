FactoryGirl.define do
  factory :dentist, class: Dentist do

    trait :empty do
    end

    trait :complete do
      name 'Alejandro'
      surname 'Sobko'
      enrollment 1234
      location 'Quilmes'
      institution 'TIP'
      street 'Siempreviva'
      number 123
      telephone 42789393
      cellphone 1512233445
      email 'ale@sobko.com'
      specialty 'Rails development'
      attention_datetime DateTime.now.utc
    end

  end
end