class VisitorService

  def initialize(params)
    @params = params
  end

  def create
    if @params[:visitor][:id]
      Visitor.find(@params[:visitor][:id])
    else
      Visitor.new(visitor_params)
    end
  end

  def visitor_params
    @params.require(:visitor).permit(:name)
  end

end