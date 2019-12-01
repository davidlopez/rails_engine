class DateSerializer
  include FastJsonapi::ObjectSerializer
  attribute :best_day do |obj|
    obj.best_day
  end
end
