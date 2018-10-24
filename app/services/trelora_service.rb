class TreloraService

  def find_member(email, password)
    find_member_request(email, password)
  end

  private

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

end
