class VisitorService

  def initialize(params)
    @params = params
  end

  def find_or_new
    if @params[:visitor][:id]
      visitor = Visitor.find(@params[:visitor][:id])
      visitor.update! @params[:visitor]
    else
      Visitor.new({name: @params[:visitor][:name]})
    end
  end

end