class TreloraService

  def find_member(member_params)
    find_member_request(member_params)
  end

  private

  def conn
    Faraday.new(:url => "https://www.trylora.com/api/v0/turing") do |faraday|
      faraday.headers["Content-Type"] = "application/json"
      faraday.headers["Accept"] = "application/json"
      faraday.adapter Faraday.default_adapter
    end
  end

  def find_member_request(member_params)
    payload = {
      "email": member_params[:email],
      "password": member_params[:password]
    }
    response = conn.post("members", payload.to_json)
    member_data = JSON.parse(response.body, symbolize_names: true)
  end

end
