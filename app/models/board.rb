class Board
  include Mongoid::Document

  include Mongoid::Document
  field :name, type: String
  field :type, type: String
  field :description, type: String
  
  belongs_to :user
end
