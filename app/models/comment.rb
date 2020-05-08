class Comment < ApplicationRecord
    belongs_to :place
    belongs_to :user

    validates_presence_of :content


    # def name= 
    #     if self.name == nil 
    #         self.name = "Anonymous" 
        

            #add elsif statement here that sets the name to the username of the current user.


    #     end
    # end

end
