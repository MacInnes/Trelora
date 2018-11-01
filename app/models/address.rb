class Address
  def initialize(address_value)
    @address_value = address_value
  end

  def value
    @address_value
  end

  def name
    @address_value.gsub(/[_-]/, ' ').split.map(&:capitalize).join(' ')
  end
end
