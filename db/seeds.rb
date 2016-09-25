# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# TODO: No tienen dias y horarios de atencion
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

Dentist.create(dentists)

visitors = [{name: 'Juan'}, {name: 'Carlos'}, {name: 'Eduardo'}, {name: 'Gaston'}, {name: 'Fernando'}]
Visitor.create(visitors)

Visit.create([{dentist: Dentist.find(1), visitor: Visitor.find(1), visit_date: DateTime.new(2016, 02, 23), observations: 'Birthday'},
              {dentist: Dentist.find(2), visitor: Visitor.find(2), visit_date: DateTime.new(2016, 03, 13), observations: 'New pencils'},
              {dentist: Dentist.find(3), visitor: Visitor.find(3), visit_date: DateTime.new(2016, 03, 19), observations: 'Best derivations'},
              {dentist: Dentist.find(4), visitor: Visitor.find(4), visit_date: DateTime.new(2016, 05, 03), observations: 'New note books'},
              {dentist: Dentist.find(5), visitor: Visitor.find(5), visit_date: DateTime.new(2016, 06, 04), observations: 'Control'}])
