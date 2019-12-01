class ApplicationController < ActionController::API

  def which_resource
    resource = self.class.to_s.scan(/(?<=::|V1::)\w*(?=sController|s::)/)
    if resource.length < 0
      resource[0].constantize
    else
      resource[-1].constantize
    end
  end

  def which_serializer
    (which_resource.to_s + 'Serializer').constantize
  end
end
