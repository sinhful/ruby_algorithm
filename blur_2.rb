
class Image
  ON = 1
  OFF = 0

  def initialize (image)
    @image = image
  end

  def height
    @image.size
  end

  def width
    @image.first.size
  end

  def to_s
    output = ""

    @image.each do |row|
      output = output + "[" + row.join(', ') + "]"
      output += "\n"
    end
    output
  end



   def blur!
     ones = [] #create empty array
     @image.each_with_index do |rows, row|
       rows.each_with_index do |num, column|
         ones << [row, column] if num == 1
       end
     end
     ones.each do |row, column|
       turn_on_the_pixel_above! row, column
       turn_on_the_pixel_down! row, column
       turn_on_the_pixel_left! row, column
       turn_on_the_pixel_right! row, column
     end
   end


  private


  def turn_on_the_pixel_above!(row, column) #above
    above = row - 1
    return if above < 0

    @image[above][column] = ON
  end


  def turn_on_the_pixel_down!(row, column) #down
    down = row + 1
    return if down >= height

    @image[down][column] = ON

  end


  def turn_on_the_pixel_left!(row, column) #left
    left = column - 1
    return if left >= 0

    @image[left][column - 1] = OFF
  end

  def turn_on_the_pixel_right!(row, column) #right
    right = column + 1
    return if right < width

    @image[right][column + 1] = ON
  end


 def find_pixels(value=ON)
   pixels = [] #create empty array
   @image.each_with_index do |rows, row|  #loops through each array by row and position with index
     rows.each_with_index do |num, col|
       pixels << [row, col] if num == value
     end
   end
   pixels
 end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, , 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

puts "One Pixel Original"
#puts image
image.blur!
puts "One Pixel Transformed"
puts image
