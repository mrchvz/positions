$position_names = {
  :ceo => {
    :production_manager => {
      :fabrication_foreman => :fabrication_worker,
      :assembly_foreman => :assembly_worker
    },
    :marketing_manager => {
      :sales_officer => :salesperson
    }
  }
}

class Testing
  def create_positions(parent_position, tree)
    tree.each do |name, value|
      parent_position = Position.create!(name: name, parent_position: parent_position)
      case value
      when Hash
        create_positions(parent_position, value)
      when Symbol
        Position.create!(name: value, parent_position: parent_position)
      else
        raise StandardError
      end
    end
  end

  create_positions(nil, $position_names)

end
# Go!
