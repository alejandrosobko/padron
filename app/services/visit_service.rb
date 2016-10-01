class VisitService

  def initialize(params)
    @params = params
  end

  def create
    dentist = DentistService.new(@params).create
    visitor = VisitorService.new(@params).create
    Visit.new({dentist: dentist,
               visitor: visitor,
               visit_date: visit_date_parsed,
               observations: @params[:visit][:observations]})
  end


  private

  def visit_date_parsed
    DateTime.parse(@params.fetch(:visit_date, DateTime.now)).utc.iso8601
  end

end