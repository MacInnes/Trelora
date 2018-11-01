class TreloraService

  def find_member(email, password)
    find_member_request(email, password)
  end

  def find_address(address, auth_token)
    find_address_request(address, auth_token)
  end

  def post_form(email, auth_token, address, params = {})
    post_form_request(email, auth_token, address, params)
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

  def post_form_request(email, auth_token, address, params = {})
    payload = {
      "email": email,
      "HTTP_AUTH_TOKEN": auth_token,
      "address": address,
      "about_this_home": params[:about_the_home],
      "list_price": params[:recommended_list_price],
      "client_enthusiasm": params[:update_client_enthusiasm],
      "commission": params[:buyer_agent_commission],
      "about_the_seller": params[:about_the_seller],
      "credit_card": params[:credit_card_number],
      "exp_date": params[:date][:credit_card_expiration_month] + "/" + params[:date][:credit_card_expiration_year]
    }
    response = conn.post("update_listing_consultation", payload.to_json)
  end
end
