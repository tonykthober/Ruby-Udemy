class BaseLaser

  attr_accessor :x, :y, :width, :height, :color1, :color2, :laser_speed

  def self.load_laser_sound(galigoo_window)
    @laser_sound_file = Gosu::Sample.new('media/fire.ogg')
  end

  def initialize(galigoo_window, ship, x, y)
    @galigoo_window = galigoo_window
    @ship = ship
    @x = x
    @y = y
    @width = 2
    @height = 30
    @laser_speed = 15
    @color1 = Gosu::Color.new(0xff_00ffff)
    @color2 = Gosu::Color.new(0xff_ff00ff)
    @laser_sound = self.class.load_laser_sound(@galigoo_window)
    @laser_sound_frequency = 0.15
    @laser_volume = 2.0
    @muted =false
  end

  def update
    @y = @y - @laser_speed
  end

  def draw
    @galigoo_window.draw_quad(
      x - width,
      y,
      @color1,
      x + width,
      y,
      @color1,
      x - width,
      y + height,
      @color2,
      x + width,
      y + height,
      @color2,
      ZOrder::LASER
    )
  end

  def fire
    play_laser
  end

  def play_laser
    @galigoo_window.play_sound(@laser_sound, @laser_sound_frequency, @laser_volume)
  end
end