class Asteroid

  TILE_WIDTH = 25
  TILE_HEIGHT = 25
  attr_accessor :height, :width, :x, :y, :size

  def self.load_animation(galigoo_window)
    @animation = Gosu::Image::load_tiles(galigoo_window, 'media/asteroid.png', TILE_WIDTH, TILE_HEIGHT, false)
  end

  def self.load_sound(galigoo_window)
    @sound = Gosu::Sample.new('media/boom.wav')
  end

  def initialize(galigoo_window, speed = 0.5)
    @galigoo_window = galigoo_window
    @asteroid_animation = self.class.load_animation(galigoo_window)
    @x = rand(galigoo_window.width - TILE_WIDTH)
    @y = 0
    @size = rand(3) + 1
    @height = TILE_HEIGHT * @size
    @width = TILE_WIDTH * @size
    @boom =  self.class.load_sound(galigoo_window)
    @color = Utilities::random_color
    @speed = speed
  end

  def destroy
    @galigoo_window.remove_asteroid(self)
    @galigoo_window.play_sound(@boom, 0.5, (1.0 / @size.to_f))
  end

  def draw
    image = @asteroid_animation[(Gosu::milliseconds / 100) % @asteroid_animation.size]
    image.draw_rot(@x, @y, ZOrder::ASTEROID, -90, 0.5, 0.5, @size, @size, @color)
  end

  def update
    @y = @y + @speed
    if (@y - height) > @galigoo_window.height
      @galigoo_window.remove_asteroid(self)
    end
  end

  def radius
    (19.0  * @size) / 2.0
  end

  def self.collide?(thing1, thing2)
    distance = Gosu::distance(thing1.x, thing1.y, thing2.x, thing2.y)
    distance < (thing1.radius + thing2.radius)
  end
end