class DoubleLaser < BaseLaser

  def initialize(galigoo_window, ship, x, y)
    
    super

    color_1 = 0xff_ffff00
    color_2 = 0xff_00ff00

    single_laser_1 = SingleLaser.new(galigoo_window, self, x - 15, y)
    single_laser_2 = SingleLaser.new(galigoo_window, self, x + 15, y)

    @lasers = [single_laser_1, single_laser_2]

    @lasers_sound_frequency = 0.15
    @lasers_volume = 2.0
  end

  def draw
    @lasers.each do |laser|
      laser.draw
    end
  end

  def update
    @lasers.each do |laser|
      laser.update
    end
  end

  def collide?(thing)
    @lasers.any? do |laser|
      laser.collide?(thing)
    end
  end

  def remove_laser(lasers)
    @lasers.delete(lasers)
    if @lasers.empty?
      @ship.remove_laser(self)
    end
  end
end