class VisitService

  def initialize(params)
    @params = params
  end

  def find_or_new
    visitor = VisitorService.new(@params).find_or_new
    if @params[:visit][:id]
      visit = Visit.find(@params[:visit][:id])
      visit.update!({visitor: visitor, visit_date: visit_date_parsed, observations: @params[:visit][:observations]})
    else
      Visit.new({visitor: visitor, visit_date: visit_date_parsed, observations: @params[:visit][:observations]})
    end
  end


  private

  def visit_date_parsed
    DateTime.parse(@params[:visit].fetch(:visit_date, DateTime.now.utc.iso8601)).utc
  end

end