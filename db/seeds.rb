# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


dentists = [{name: 'Alejandro', surname: 'Sobko', enrollment: 1234, locations: %w(Quilmes Bernal),
             institutions: ['TIP Inc'], streets: %w(Mitre Lavalle), numbers: [123, 3444], telephones: [42789999],
             cellphones: [1534498431], emails: ['alejandro@gmail.com'], specialty: 'Ortodoncia'},

            {name: 'Juan', surname: 'Perez', enrollment: 56789, locations: ['Berazategui'],
             institutions: ['Dentist SA'], streets: ['Calle 14'], numbers: [1145], telephones: [47287332],
             cellphones: [1524464552, 159349392], emails: ['juancho.12@gmail.com'], specialty: 'Caries'},

            {name: 'Nadia', surname: 'Gonzalez', enrollment: 2234, locations: ['Quilmes'],
             institutions: ['NaGon'], streets: ['General Paz'], numbers: [5466], telephones: [42568823],
             cellphones: [1590089973], emails: %w(na.gonzalez@gmail.com alguienmas@hotmail.com), specialty: 'Ortodoncia'},

            {name: 'Pedro', surname: 'Diente', enrollment: 1899, locations: %w(Bernal Ezpeleta),
             institutions: ['Dientes exceptions'], streets: %w(Siempreviva AlgunaRara), numbers: [900, 9090],
             cellphones: [1588923444], emails: ['dientes@gmail.com'], specialty: 'Radiografías'},

            {name: 'Agustin', surname: 'Rodriguez', enrollment: 6723, locations: ['Ezpeleta'],
             institutions: ['Diente Limpio'], streets: ['Rio Gallegos'], numbers: [8989], telephones: [42897223],
             cellphones: [1578823712], emails: ['agustin.r@gmail.com'], specialty: 'Caries'}]

visitors = [{name: 'Juan'}, {name: 'Carlos'}, {name: 'Eduardo'}, {name: 'Gaston'}, {name: 'Fernando'}]
visit_dates = [DateTime.new(2016, 02, 23), DateTime.new(2016, 03, 13), DateTime.new(2016, 03, 19), DateTime.new(2016, 05, 03), DateTime.new(2016, 06, 04)]
observations = ['Birthday', 'New pencils', 'Best derivations', 'New note books', 'Control']

dentists.zip(visitors, [0, 1, 2, 3, 4]).each do |dentist, visitor, index|
  visit = Visit.new({visitor: Visitor.new(visitor),
                     visit_date: visit_dates[index],
                     observations: observations[index]})

  days = WorkableDay.new({day: 'Lunes', workable_hours: [WorkableHour.new({from: 9, to: 10}), WorkableHour.new({from: 12, to: 15})]})
  Dentist.create!(dentist.merge(visits: [visit], work_calendar: WorkCalendar.new({workable_days: [days]})))
end
