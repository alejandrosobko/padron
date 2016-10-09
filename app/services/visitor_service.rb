class VisitorService

  def initialize(params)
    @params = params
  end

  def find_or_new
    if @params[:visitor][:id]
      visitor = Visitor.find(@params[:visitor][:id])
      visitor.update! visitor_params
    else
      Visitor.new(visitor_params)
    end
  end


  private

  def visitor_params
    @params.require(:visitor).permit(:name)
  end

end