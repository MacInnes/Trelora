class TreloraService

  def find_member(email, password)
    find_member_request(email, password)
  end

  def find_address(address, auth_token)
    find_address_request(address, auth_token)
  end

  private

  # "Josh's kind of fun" extract this code into a gem

  def conn
    Faraday.new(:url => "https://www.trylora.com/api/v0/turing") do |faraday|
      faraday.headers["Content-Type"] = "application/json"
      faraday.headers["Accept"] = "application/json"
      faraday.adapter Faraday.default_adapter
    end
  end

  def find_member_request(email, password)
    payload = {
      "email": email,
      "password": password
    }
    response = conn.post("members", payload.to_json)
    member_data = JSON.parse(response.body, symbolize_names: true)
  end

  def find_address_request(address, auth_token)
    payload = {
      "address": address,
      "HTTP_AUTH_TOKEN": auth_token
    }
    response = conn.post("properties", payload.to_json)
    address_data = JSON.parse(response.body, symbolize_names: true)
  end
end
