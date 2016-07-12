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
     @youtube = an.Youtube
     @response = HTTParty.get("http://hummingbird.me/api/v2/anime/#{@token}.json", headers:{'X-Client-Id'=> auth})
     if(@youtube == "" ||@youtube == nil) then
   	   @vid = "https://www.youtube.com/embed/#{@response.parsed_response['anime']['youtube_video_id']}?autoplay=1&amp;&showinfo=0&amp;rel=0&amp;controls=0&amp;showinfo=0"
     else
       @vid = "https://www.youtube.com/embed/#{@youtube}?autoplay=1&amp;&showinfo=0&amp;rel=0&amp;controls=0&amp;showinfo=0"
     end
   end
end
