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

def create_positions(parent_position, tree) # se define el metodo con parent_position y tree como argumentos
  tree.each do |name, value| # iteramos sobre el hash
    parent_position = Position.create!(name: name, parent_position: parent_position) # declaramos la variable parent_position en la que crearemos nuevas instancias
    case value # case statement
    when Hash
      create_positions(parent_position, value) # cuando el valor es un hash se crea parent_position con el value del hash
    when Symbol
      Position.create!(name: value, parent_position: parent_position) # cuando el valor es un symbol se crea el nombre con el valor correspondiente, y parent_position es parent_position
    else
      raise StandardError # cuando el valor no es un hash o symbol se levanta una excepción
    end # se cierra es case statement, linea 19
  end # se cierra la iteracion, linea 17
end #se cierra el metodo, linea 16

# Go!
create_positions(nil, $position_names) # usamos el metodo dentro del metodo
