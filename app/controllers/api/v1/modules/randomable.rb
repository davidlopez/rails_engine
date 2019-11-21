module Randomable
  def show
    render json: which_serializer.new(which_resource.random)
  end
end
