class Position < ActiveRecord::Base
  has_many :children_positions, class_name: 'Position', foreign_key: 'parent_position_id'
  belongs_to :parent_position, class_name: 'Position', foreign_key: 'parent_position_id'
end
