#Base class that will be extended by all model classes
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
