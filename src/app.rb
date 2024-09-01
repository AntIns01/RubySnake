require_relative "views/ruby2d"
require_relative "models/state"
require_relative "actions/actions"

class App
  def initialize
    @state = Model::initial_state
  end

  def start
    @view = View::Ruby2dView.new(self)
    timer_thread = Thread.new { init_timer }
    @view.start(@state)
    timer_thread.join
  end

  def init_timer
    loop do
      if @state.game_end
        puts "Juego Finalizado"
        puts "Puntaje: #{@state.snake.positions.length}"
        break
      end
      #Mover la serpiente
      @state = Actions::move_snake(@state)
      @view.render_view(@state)
      sleep 0.5
    end
  end

  def send_action(action, params)
    new_state = Actions.send(action, @state, params)
    if new_state.hash != @state
      @state = new_state
      @view.render_view(@state)
    end
  end
end

app = App.new
app.start
