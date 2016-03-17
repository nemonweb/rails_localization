class Country < ActiveRecord::Base
  has_many :subdivisions
end
