class Book < ActiveRecord::Base
  validates_presence_of :name, :isbn
  validates_uniqueness_of :isbn

  belongs_to :author
end
