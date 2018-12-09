require 'rubygems'
require 'gosu'

require_relative 'lib/ship'
require_relative 'lib/z_order'
require_relative 'lib/weapons_fire'
require_relative 'lib/utilities'
require_relative 'lib/asteroids'


class Galigoo < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Galigoo"
    @background = Gosu::Image.new('media/background.png')
    @asteroid_animation = Gosu::Image::load_tiles(self, "media/asteroid.png", 25, 25, false)
    @life_image = Ship.load_image_file(self)
    @font = Gosu::Font.new(self, Gosu::default_font_name, 25)
    @ship = Ship.new(self)
    @sounds = []
    start_game
  end

  def current_level
    (@score / 1000) + 1
  end

  def start_game
    @pause = false
    @game_over = false
    @life_counter = 3
    @base_speed = 0.5
    @asteroids = []
    @score = 0
    @ship.reset
  end

  def new_player
    if @life_counter > 0 then
      @life_counter -= 1
      @ship.spawn
    else
      @game_over = true
    end
  end

  def toggle_pause
    if @paused
      resume_sounds
    else
      pause_sounds
    end
    @paused = !@paused
  end
  
  def play_sound(sound, frequency = 1.0, volume = 1.0)
    @sounds << sound.play(frequency, volume)    
  end

  def clear_stopped_sounds
    @sounds.reject! { |sound| @sound.playing? && !sound.paused? }
  end

  def pause_sounds
    @sounds.each { |sound| sound.pause if sound.playing? }
  end

  def resume_sounds
    @sounds.each { |sound| sound.resume if sound.paused? }
  end
  
  def update
    unless @paused || @game_over
    @ship.update
    @asteroids.each do |asteroid|
      asteroid.update
      end
    populate_asteroids
    check_collisions
    end
  end

  def check_collisions
    destroyed = []
    @asteroids.each do |asteroid|
      if @ship.collide?(asteroid)
        @score += (10 * (3.0 / asteroid.size)).to_i
        destroyed << asteroid
      end
    end
    destroyed.each do |asteroids|
      asteroids.destroy
    end
  end

  def remove_asteroid(asteroid)
    @asteroids.delete(asteroid)
  end

  def populate_asteroids
    @base_speed = ((current_level = 1) * 0.2) + 0.5
    max_speed = 10
    max_asteroids = 12 + (current_level * 2)
    prob = 2 + (current_level * 0.5)

    if rand(100) < prob and @asteroids.size < max_asteroids then 
      @asteroids.push(Asteroid.new(self, [@base_speed, max_speed].min))
    end
  end
  
  def draw
    draw_game_ui
    @background.draw(0, 0, ZOrder::BACKGROUND)
    @ship.draw
    @asteroids.each do |asteroid|
      asteroid.draw
      @ship.draw unless @game_over
    end
  end

  def draw_game_ui
    @font.draw_text("Galigoo Score: #{@score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xff_00ffff)

    text_width = @font.text_width("Level: #{current_level}")
    @font.draw_text("Level: #{current_level}", (width - 20 - text_width), 10, ZOrder::UI, 1.0, 1.0, 0xff_00ffff)

    draw_life_counter
    draw_pause_screen if @paused
    draw_game_over_screen if @game_over
  end

  def draw_pause_screen
    draw_text("Paused", 310, 230)
    draw_text("Escape - Quit", 310, 270)
    draw_text("Space/L_Alt - Fire Weapons", 310, 310)
    draw_text("N - Nuke", 310, 350)
  end

  def draw_game_over_screen
    draw_text("Game Over!", 310, 240)
    draw_text("Press Enter to Play Again", 310, 280)
    # draw_text("Escape - Quit", 310, 310)
  end

  def draw_life_counter
    if @life_counter > 0
      # draw number of ships left
      @life_counter.times do |times|
        @life_image.draw_rot(20 + (times * 28), (height - 20), ZOrder::UI, 0, 0.5, 0.5, factor_x = 0.4, factor_y = 0.4)
      end
      # draw box around ships
      draw_line(0, (height - 40), 0xff_00ff00, 10 + (@life_counter * 28), (height - 40), 0xff_00ff00, ZOrder::UI)

      draw_line(10 + (@life_counter * 28), height, 0xff_00ff00, 10 + (@life_counter * 28), (height - 40), 0xff_00ff00, ZOrder::UI)
    end
  end

  def draw_text(text, x, y)
    text_width = @font.text_width(text)
    text_height = @font.height
    @font.draw_text(text, (x - text_width / 2), (y - text_height / 2), ZOrder::UI, 1.0, 1.0, 0xff_00ffff)
  end

  def button_down(id)
    if @game_over then
      if id == Gosu::KbEnter or id == Gosu::KbReturn
        self.start_game
      end
    else      
    case id
    when Gosu::KbP
      toggle_pause
      when Gosu::KbQ, Gosu::KbEscape
        close
      else
        @ship.button_down(id)
      end
    end
  end
end


galigoo_window = Galigoo.new
galigoo_window.show 