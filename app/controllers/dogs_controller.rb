class DogsController < ApplicationController
  def search
    conn = Faraday.new(url: "https://api.thedogapi.com/v1/breeds/") do |faraday|
      faraday.headers["x-api-key"] = ENV['api_key']
      faraday.params['q'] = params[:search]
    end
    response = conn.get("search")

    data = JSON.parse(response.body, symbolize_names: true)

    @dog = data.first

    render "welcome/index"
  end
end
