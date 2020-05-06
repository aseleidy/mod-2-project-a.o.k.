class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  def set_likes_to_zero
    if self.likes == nil 
      self.likes = 0 
    end 
  end 



end
