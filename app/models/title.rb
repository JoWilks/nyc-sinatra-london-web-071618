class Title < ActiveRecord::Base

  has_many :figures, through: :title_figures
  @@figures= []

  def figures
    @@figures
  end

end
