class HomeController < ApplicationController
  def index
   #  auth = '936dd662054f71d5c137'
   #  r = rand(10913);

   #  @response = HTTParty.get("http://hummingbird.me/api/v2/anime/#{r}.json", headers:{'X-Client-Id'=> auth})
   #  @titles =  @response.parsed_response["anime"]["titles"]
   end

  def search
  	auth = '936dd662054f71d5c137'
  	@all = Anime.count
  	r = rand(24)
  	if r==0 then r = rand(24) end
  	an = Anime.find(r)
  	@token = an.token
  	@ename = an.e_title
  	@jname = an.j_title
  	@response = HTTParty.get("http://hummingbird.me/api/v2/anime/#{@token}.json", headers:{'X-Client-Id'=> auth})
    @titles =  @response.parsed_response["anime"]["titles"]
  end

end
