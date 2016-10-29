FactoryGirl.define do

  factory :dentist, class: Dentist do
    name 'Alejandro'
    surname 'Sobko'
    enrollment 1234
    locations ['Quilmes']
    institutions ['TIP']
    streets ['Siempreviva']
    numbers [123]
    telephones []
    cellphones [1512233445, 15933827466]
    emails ['ale@sobko.com']
    specialty 'Rails development'
  end

end