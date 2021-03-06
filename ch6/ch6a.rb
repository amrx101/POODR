=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
CHAPTER 6 - Acquiring Behavior Through Inheritance, Starting with a Concrete Class pg.107-8
=end

class Bicycle
  attr_reader :size, :tape_color
  def initialize(args)
    @size       = args[:size]
    @tape_color = args[:tape_color]
  end


  # every bike has the same defaults
  # for tire and chain size
  def spares
    { chain:       '10-speed',
      tire_size:   '23',
      tape_color:  tape_color}
  end

  # many other methods
end

bike = Bicycle.new(
        size:        'M',
        tape_color:  'red' )

bike.size     # -> 'M'
bike.spares
# => {:tire_size   => 'M',
#     :chain       => '10-speed',
#     :tape_color  => 'red'}

puts 'bike is: ' + bike.to_s
puts 'bike.class is: ' + bike.class.to_s
puts 'bike_size is: ' + bike.size.to_s
puts 'bike.spares are: ' + bike.spares.to_s


