position_names = {
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
def create_positions(parent_position, tree) # define metodo con 2 argumentos
  tree.each do |name, value| # itera sobre los valores del hash en tree
    parent_position = Position.create!(name: name, parent_position: parent_position) # se declara parent_position, que es una nueva instancia de Position
    case value # case statement open
    when Hash # si value Hash
      create_positions(parent_position, value) # corre metodo create_positions
    when Symbol # si value Symbol
      Position.create!(name: value, parent_position: parent_position) # crea instancia de Position
    else # value otra cosa
      raise StandardError # levanta excepcion
    end # cierra case
  end # cierra iterador
end # cierra metodo
# Go!
create_positions(nil, position_names) # corre metodo create_positions con position_names
