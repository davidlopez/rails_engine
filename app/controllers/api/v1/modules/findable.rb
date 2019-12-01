module Findable
  def index
    render json: which_serializer.new(which_resource.where(find_params).order(:id))
  end

  def show
    render json: which_serializer.new(which_resource.find_by(find_params))
  end
end
