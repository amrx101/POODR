=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
CHAPTER 6 - Acquiring Behavior Through Inheritance, Understanding Coupling pg. 133
=end


class Bicycle
  attr_reader :size, :chain, :tire_size
  
  def initialize(args={})                 # <- WHY THE HASH FOR args={} ???
    @size      = args[:size]
    @chain     = args[:chain]     || default_chain
    @tire_size = args[:tire_size] || default_tire_size
  end

  def spares
    { tire_size:  tire_size,
      chain:      chain}
  end
  
  def default_chain
    '10-speed'
  end

  def default_tire_size
    raise NotImplementedError,
          "This #{self.class} cannot respond to:"
  end
end



class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args)
  end

  def spares
    super.merge({ tape_color:   tape_color})
  end

  def default_tire_size
    '23'
  end
end



class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge({rear_shock: rear_shock})
  end
  
  def default_tire_size
    '2.1'
  end
end



class RecumbentBike < Bicycle
  attr_reader :flag
  
  def initialize(args)
    @flag = args[:flag] # forgot to send "super"
  end
  
  def spares
    super.merge({flag: flag})
  end
  
  def default_chain
    '9-speed'
  end
  
  def default_tire_size
    '28'
  end
end

bent = RecumbentBike.new(flag: 'tall and orange')
puts bent.spares.to_s.split(', ')
# -> {:tire_size => nil, <- didn't get initialized
#     :chain     => nil, 
#     :flag      => 'tall and orange'}



# road_bike = RoadBike.new(
              # size:        'M',
              # tape_color:  'red' )

# puts road_bike.tire_size            # => '23'
# puts road_bike.chain                # => "10-speed"
# puts

# mountain_bike = MountainBike.new(
                  # size:         'S',
                  # front_shock:  'Manitou',
                  # rear_shock:   'Fox')

# puts mountain_bike.tire_size        # => '2.1'
# puts mountain_bike.chain            # => "10-speed"
# puts mountain_bike.spares
# puts

# puts road_bike.inspect.split(' ')
# puts
# puts mountain_bike.inspect.split(' ')
# puts

