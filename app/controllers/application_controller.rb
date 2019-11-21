class ApplicationController < ActionController::API

  def which_resource
    self.class.to_s.scan(/(?<=V1::|s::)\w*(?=sController|s::)/)[0].constantize
  end

  def which_serializer
    (which_resource.to_s + 'Serializer').constantize
  end
end
