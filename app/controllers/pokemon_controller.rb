class PokemonController < ApplicationController

  def index
  end

  def show
    test = "http://pokeapi.co/api/v2/pokemon/#{params[:id]}/" #the search for id/name is going on the server side
    api_response_pokemon = HTTParty.get(test)
    pokemon_body = JSON.parse(api_response_pokemon.body)
    # name  = body["name"]
    # id = body["id"]
    # types = body["types"]

    api_response_giphy = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_KEY"]}&q=pikachu")
    giphy_body = JSON.parse(api_response_giphy.body)
    # binding.pry


    respond_to do |format|
      format.html #defaults to html, then json
      format.json do
        render json: {
          name: pokemon_body["name"],
          id: pokemon_body["id"],
          types: pokemon_body["types"][0]["type"]["name"],
          giphy_url: giphy_body["data"][0]["url"]
        }
      end
    end
  end
end
