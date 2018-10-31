class AddressFacade

  def initialize(address, auth_token)
    @address = address
    @auth_token = auth_token
  end

  def is_invalid?
    address_data == nil
  end

  # Client info
  def client_name
    client_data[:client_info][:name]
  end


  def client_email
    client_data[:client_info][:email]
  end

  def client_phone
    client_data[:client_info][:phone]
  end

  def opted_in?
    client_data[:opted_in][:result]
  end

  def opted_in
    if opted_in? == true
      "Yes"
    else
      "No"
    end
  end


  def found_us
    client_data[:found_us]
  end

  def enthusiasm
    client_data[:enthusiasm]
  end

  def timing
    client_data[:timing]
  end

  def adopter_type
    client_data[:adopter_type]
  end

  def stage
    client_data[:stage]
  end

  # TODO Missing retainer field

  # Estimates

  def zestimate
    zillow_data[:zestimate]
  end

  def zillow_low
    zillow_data[:low]
  end

  def zillow_high
    zillow_data[:high]
  end

  def home_junction_low
    home_junction_data[:low]
  end

  def home_junction_high
    home_junction_data[:high]
  end

  def regional_average
    home_junction_data[:regional_avg]
  end

  # Listing data

  # TODO Break this up
  # def updates
  #   listing_data[:home_updates]
  # end
  def exterior_updates
    listing_data[:home_updates][:exterior]
  end

  def interior_updates
    listing_data[:home_updates][:interior]
  end

  def location
    "https://maps.googleapis.com/maps/api/staticmap?center=#{coordinates}&size=150x150&zoom=12&markers=%7C#{coordinates}&key=#{ENV["GOOGLE_MAPS_API_KEY"]}"
  end

  def coordinates
    [listing_data[:coordinates][:latitude], listing_data[:coordinates][:longitude]].join(",")
  end

  def address
    [format_address_data[:address1], format_address_data[:city], format_address_data[:state], format_address_data[:zip]].join(", ")
  end

  def zillow_address
    replaced = format_address_data[:address1].gsub(/ /, "-")
    [replaced, format_address_data[:city], format_address_data[:state], format_address_data[:zip]].join(",-") + "_rb"
  end


  private

    def address_data
      @address_data ||= AddressSearch.new.find_address(@address, @auth_token)
    end

    def format_address_data
      listing_data[:address]
    end

    def listing_data
      address_data[:listing]
    end

    def client_data
      address_data[:client]
    end

    def zillow_data
      address_data[:pricing_estimates][:zillow]
    end

    def home_junction_data
      address_data[:pricing_estimates][:home_junction]
    end
end
