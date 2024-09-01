require "ruby2d"
require_relative "../models/state"

module View
  class Ruby2dView
    def initialize(app)
      @pixel_size = 50
      @app = app
    end

    def start(state)
      extend Ruby2D::DSL
      set(
        background: "green",
        title: "Snake",
        width: @pixel_size * state.grid.cols,
        height: @pixel_size * state.grid.rows,
      )
      on :key_down do |event|
        # A key was pressed
        #puts event.key
        handle_key_event(event)
      end
      show
    end

    def render_view(state)
      render_food(state)
      render_snake(state)
    end

    private

    def render_food(state)
      extend Ruby2D::DSL
      close if state.game_end
      @food.remove if @food
      extend Ruby2D::DSL
      food = state.food

      @food = Square.new(
        color: "blue",
        x: food.col * @pixel_size,
        y: food.row * @pixel_size,
        #z:10,
        size: @pixel_size,
      )
    end

    def render_snake(state)
      @snake_positions.each(&:remove) if @snake_positions
      extend Ruby2D::DSL
      snake = state.snake

      @snake_positions = snake.positions.map do |pos|
        Square.new(
          color: "black",
          x: pos.col * @pixel_size,
          y: pos.row * @pixel_size,
          #z:10,
          size: @pixel_size,
        )
      end
    end

    def handle_key_event(event)
      case event.key
      when "up"
        @app.send_action(:change_directions, Model::Direction::UP)
      when "down"
        @app.send_action(:change_directions, Model::Direction::DOWN)
      when "right"
        @app.send_action(:change_directions, Model::Direction::RIGHT)
      when "left"
        @app.send_action(:change_directions, Model::Direction::LEFT)
      end
    end
  end
end
