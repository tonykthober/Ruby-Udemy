require 'rubygems'
require 'gosu'

require_relative 'lib/ship'
require_relative 'lib/z_order'
require_relative 'lib/weapons_fire'


class Galigoo < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Galigoo"
    @background = Gosu::Image.new('media/background.png')
    @ship = Ship.new(self)
    @sounds = []
  end
  
  def play_sound(sound, frequency = 1.0, volume = 1.0)
    @sounds << sound.play(frequency, volume)
  end

  def update
    @ship.update
  end
  
  def draw
    @background.draw(0, 0, ZOrder::BACKGROUND)
    @ship.draw
  end

  def button_down(id)
    case id
      when Gosu::KbQ, Gosu::KbEscape
        close
      else
        @ship.button_down(id)
    end
  end
end


galigoo_window = Galigoo.new
galigoo_window.show 