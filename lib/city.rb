class City
  attr_reader

  def intialize(attr)
    @name = attr.fetch(:name)
    @id = attr.fetch(:id)
  end
end
