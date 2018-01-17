
class Image
  def initialize(image)
    @image = image
  end


  # def output_image
  #   @image.each do |array|
  #     puts array.join
  #   end
  # end


   def to_s
     output = ""

    @image.each do |array|
       output = output + "[" + array.join(', ') + "]"
       output += "\n"
     end

    output
   end

#   def to_s
#     @image.map { |row| row.join(', ') }.join("\n")
#   end
end


image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

puts image
#image.output_image






# class Image

#   def initialize (image)
#     @image= image
#   end

#   def to_s
#     output = ""

#     @image.each do |row|
#       output = output + "[" + row.join(',') + "]"
#       output += "\n"
#     end

#     output

# end


# image = Image.new([
#   [0, 0, 0, 0],
#   [0, 1, 0, 0],
#   [0, 0, 0, 1],
#   [0, 0, 0, 0]
# ])

# puts image
