class PokemonController < ApplicationController

  def index
  end

  def show
    api_response = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
    body = JSON.parse(api_response.body)
    # name  = body["name"]
    # id = body["id"]
    # types = body["types"]

    respond_to do |format|
      format.html #defaults to html, then json
      format.json do
        render json: {
          name: body["name"],
          id: body["id"],
          types: body["types"]
        }
      end
    end
  end
end
