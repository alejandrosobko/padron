# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


dentists = [{name: 'Alejandro', surname: 'Sobko', enrollment: 1234, location: 'Quilmes',
             institution: 'TIP Inc', street: 'Mitre', number: 123, telephone: 42789999,
             cellphone: 1534498431, email: 'alejandro@gmail.com', specialty: 'Ortodoncia'},
            {name: 'Juan', surname: 'Perez', enrollment: 56789, location: 'Berazategui',
             institution: 'Dentist SA', street: 'Calle 14', number: 1145, telephone: 47287332,
             cellphone: 1524464552, email: 'juancho.12@gmail.com', specialty: 'Caries'},
            {name: 'Nadia', surname: 'Gonzalez', enrollment: 2234, location: 'Quilmes',
             institution: 'NaGon', street: 'General Paz', number: 5466, telephone: 42568823,
             cellphone: 1590089973, email: 'na.gonzalez@gmail.com', specialty: 'Ortodoncia'},
            {name: 'Pedro', surname: 'Diente', enrollment: 1899, location: 'Bernal',
             institution: 'Dientes exceptions', street: 'Siempreviva', number: 900,
             cellphone: 1588923444, email: 'dientes@gmail.com', specialty: 'Radiografías'},
            {name: 'Agustin', surname: 'Rodriguez', enrollment: 6723, location: 'Ezpeleta',
             institution: 'Diente Limpio', street: 'Rio Gallegos', number: 8989, telephone: 42897223,
             cellphone: 1578823712, email: 'agustin.r@gmail.com', specialty: 'Caries'}]

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
