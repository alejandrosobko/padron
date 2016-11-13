institutes = [Institute.new({name: 'Super dientes', location: 'Quilmes', street: 'Lavalle', number: 1818}),
              Institute.new({name: 'Dentistas Bernal', location: 'Bernal', street: 'Saens Peña', number: 3000}),
              Institute.new({name: '', location: '', street: '', number: nil}),
              Institute.new({name: 'Instituto de dentistas de Ezpeleta', location: 'Ezpeleta', street: 'La guarda', number: 5020}),
              Institute.new({name: 'Dental pro', location: 'Buenos Aires', street: 'Balcarce', number: 50})]

dentists = [{name: 'Alejandro', surname: 'Sobko', enrollment: 1234, telephones: [42789999], cellphones: [1534498431],
             emails: ['alejandro@gmail.com'], specialty: 'Ortodoncia', institutes: [institutes[0]]},

            {name: 'Juan', surname: 'Perez', enrollment: 56789, telephones: [47287332], cellphones: [1524464552, 159349392],
             emails: ['juancho.12@gmail.com'], specialty: 'Caries', institutes: [institutes[1]]},

            {name: 'Nadia', surname: 'Gonzalez', enrollment: 2234, telephones: [42568823], cellphones: [1590089973],
            emails: %w(na.gonzalez@gmail.com alguienmas@hotmail.com), specialty: 'Ortodoncia', institutes: [institutes[2]]},

            {name: 'Pedro', surname: 'Diente', enrollment: 1899, cellphones: [1588923444],
             emails: ['dientes@gmail.com'], specialty: 'Radiografías', institutes: [institutes[3], institutes[4]]},

            {name: 'Agustin', surname: 'Rodriguez', enrollment: 6723, telephones: [42897223], cellphones: [1578823712],
             emails: ['agustin.r@gmail.com'], specialty: 'Caries', institutes: [institutes[4]]}]

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
