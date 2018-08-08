class CreateLandmarks < ActiveRecord::Migration
  #raise 'Write CreateLandmarks migration here'

def change
    create_table :landmarks do |t|
    t.integer :figure_id
    t.string :name
    t.integer :year_completed
    end
  end
end
