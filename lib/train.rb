class Train
  attr_reader :name, :id

  def intialize(attr)
    @name = attr.fetch(:name)
    @id = attr.fetch(:name)
  end
end
