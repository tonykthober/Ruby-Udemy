require 'rubygems'
require 'gosu'

require_relative 'lib/ship'

class Galigoo < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Galigoo"

    @ship = Ship.new(self)
  end
  
  def update
    @ship.update
  end
  
  def draw
    @ship.draw
  end
end


galigoo_window = Galigoo.new
galigoo_window.show 