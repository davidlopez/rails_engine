class ApplicationController < ActionController::API

  def which_resource
    resource = self.class.to_s.scan(/(?<=::|V1::)\w*(?=sController|s::)/).uniq
    return resource[-1].constantize if resource.length > 1
    resource[0].constantize
  end

  def which_serializer
    (which_resource.to_s + 'Serializer').constantize
  end
end
