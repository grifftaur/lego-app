#Had to set the belongs_it to false. Transaction rolled back.
class BuildTime < ApplicationRecord
  belongs_to :legopin, required: false
  belongs_to :user, required: false

  attr_accessor :hours, :minutes
  before_save :time_completetime


   def time_completetime
     self[:completetime] = hours.to_i * 3600 + minutes.to_i * 60
   end

end
