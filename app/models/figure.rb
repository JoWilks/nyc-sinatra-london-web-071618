class Figure < ActiveRecord::Base
  has_many :landmarks
  has_many :titles, through: :title_figure
@@titles= []

@@landmarks = []

def titles
  @@titles
end

def landmarks
  @@landmarks
end
end
