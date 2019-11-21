module IndexAndShow
  def index
    render json: which_serializer.new(which_resource.all)
  end

  def show
    render json: which_serializer.new(which_resource.find(params[:id]))
  end
end
