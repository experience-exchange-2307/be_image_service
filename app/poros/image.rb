class Image
  attr_reader :raw_image, :id

  def initialize(raw_image)
    @raw_image = raw_image
    @id = nil
  end

end