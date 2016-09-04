# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# TODO: No tienen dias y horarios de atencion
Dentist.create([{ name: 'Alejandro', surname: 'Sobko', enrollment: 1234, location: 'Quilmes',
                  institution: 'TIP Inc', street: 'Mitre', number: 123, telephone: 42789999,
                  cellphone: 1534498431, email: 'alejandro@gmail.com', specialty: 'Ortodoncia'},
                { name: 'Juan', surname: 'Perez', enrollment: 56789, location: 'Berazategui',
                  institution: 'Dentist SA', street: 'Calle 14', number: 1145, telephone: 47287332,
                  cellphone: 1524464552, email: 'juancho.12@gmail.com', specialty: 'Caries'},
                { name: 'Nadia', surname: 'Gonzalez', enrollment: 2234, location: 'Quilmes',
                  institution: 'NaGon', street: 'General Paz', number: 5466, telephone: 42568823,
                  cellphone: 1590089973, email: 'na.gonzalez@gmail.com', specialty: 'Ortodoncia'},
                { name: 'Pedro', surname: 'Diente', enrollment: 1899, location: 'Bernal',
                  institution: 'Dientes exceptions', street: 'Siempreviva', number: 900,
                  cellphone: 1588923444, email: 'dientes@gmail.com', specialty: 'Radiografías'},
                { name: 'Agustin', surname: 'Rodriguez', enrollment: 6723, location: 'Ezpeleta',
                  institution: 'Diente Limpio', street: 'Rio Gallegos', number: 8989, telephone: 42897223,
                  cellphone: 1578823712, email: 'agustin.r@gmail.com', specialty: 'Caries'}])
