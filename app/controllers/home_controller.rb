class HomeController < ApplicationController
  
  AUTH = '936dd662054f71d5c137'
  @@anime = Array.new
  
  def index
  end

 def search
  @@anime = []
  case params[:data]
  when "Romance"
    getMovie("Romance")
  when "Magic"
    getMovie("Magic", "Thriller")
  when "Mystery"
    getMovie("Mystery")
  when "Comedy"
    getMovie("Comedy")
  when "Sci-Fi"
    getMovie("Sci-Fi")
  when "Action"
    getMovie("Action")
  when "Adventure"
    getMovie("Adventure")
  else

  end
  
  @token = @@anime[0].token
  @ename = @@anime[0].e_title
  @jname = @@anime[0].j_title
  @youtube = @@anime[0].Youtube
  @dt = sendTrailer(@token, @youtube)
 
 end

 def test
  
  name = "sword-art-online-ii"
  @response = HTTParty.get("http://hummingbird.me/api/v2/anime/#{name}.json", headers:{'X-Client-Id'=> AUTH})
  render :test
 
 end

 def getMovie(*args)
    @all = Anime.count
    @@anime = Anime.where(["genre1 IN (:args) OR genre2 IN (:args) OR genre3 IN (:args) OR genre4 IN (:args) OR genre5 IN (:args)", {args: args}]).shuffle
  end

  def sendTrailer(token, youtube)
    @dt = []
    @response = HTTParty.get("http://hummingbird.me/api/v2/anime/#{token}.json", headers:{'X-Client-Id'=> AUTH})
    if(youtube == "" ||youtube == nil) then
      @dt[0] = "https://www.youtube.com/embed/#{@response.parsed_response['anime']['youtube_video_id']}?autoplay=1&amp;&showinfo=0&amp;rel=0&amp;controls=0&amp;showinfo=0"
     else
      @dt[0] = "https://www.youtube.com/embed/#{youtube}?autoplay=1&amp;&showinfo=0&amp;rel=0&amp;controls=0&amp;showinfo=0"
     end
      @dt[1] = @response.parsed_response['anime']['synopsis']
      p @dt[1]
     return @dt
  end

end
