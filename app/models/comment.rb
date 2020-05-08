class Comment < ApplicationRecord
    belongs_to :place
    belongs_to :user

    validates_presence_of :content

end
