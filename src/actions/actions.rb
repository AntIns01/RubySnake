module Actions
  def self.move_snake(state)
    #next_direction = state.curr_direction
    next_position = calc_next_position(state)
    # Verify if the next position is valid
    if position_is_food?(state, next_position)
      state = grow_snake_to(state, next_position)
      generate_food(state)
    elsif position_is_valid?(state, next_position)
      move_snake_to(state, next_position)
    else
      end_game(state)
    end
    # If it's not valid, the game ends
    # If it's valid, move the snake
  end

  def self.change_directions(state, direction)
    if next_direction_is_valid?(state, direction)
      state.curr_direction = direction
    else
      #puts "Invalid direction"
    end
    state
  end

  private

  def self.calc_next_position(state)
    snake_head = state.snake.positions.first

    case state.curr_direction
    when Model::Direction::UP
      # Decrease the row
      return Model::Coord.new(
               snake_head.row - 1,
               snake_head.col
             )
    when Model::Direction::RIGHT
      # Increase the column
      return Model::Coord.new(
               snake_head.row,
               snake_head.col + 1
             )
    when Model::Direction::DOWN
      # Increase the row
      return Model::Coord.new(
               snake_head.row + 1,
               snake_head.col
             )
    when Model::Direction::LEFT
      # Decrease the column
      return Model::Coord.new(
               snake_head.row,
               snake_head.col - 1
             )
    end
  end

  def self.position_is_valid?(state, position)
    # Implement your validation logic here
    is_invalid = ((position.row >= state.grid.rows ||
                   position.row < 0) ||
                  (position.col >= state.grid.cols ||
                   position.col < 0))

    return false if is_invalid
    return !(state.snake.positions.include? position)
  end

  def self.move_snake_to(state, next_position)
    # Implement your logic to move the snake
    new_positions = [next_position] + state.snake.positions[0...-1]
    state.snake.positions = new_positions
    state
  end

  def self.next_direction_is_valid?(state, direction)
    case state.curr_direction
    when Model::Direction::UP
      return true if direction != Model::Direction::DOWN
    when Model::Direction::LEFT
      return true if direction != Model::Direction::RIGHT
    when Model::Direction::DOWN
      return true if direction != Model::Direction::UP
    when Model::Direction::RIGHT
      return true if direction != Model::Direction::LEFT
    end
    return false
  end

  def self.grow_snake_to(state, next_position)
    #TODO implementar el crecimiento de la serpiente
    new_positions = [next_position] + state.snake.positions
    state.snake.positions = new_positions
    state
  end

  def self.position_is_food?(state, next_position)
    state.food.row == next_position.row && state.food.col == next_position.col
  end

  def self.generate_food(state)
    #random para generar la comida
    new_food = Model::Food.new(rand(state.grid.rows), rand(state.grid.cols))
    state.food = new_food
    state
  end

  def self.end_game(state)
    # Implement your logic to end the game
    state.game_end = true
    state
  end
end
