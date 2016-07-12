class HomeController < ApplicationController
  
  AUTH = '936dd662054f71d5c137'
  @@anime = Array.new
  
  def index
  end

 def search
  @@anime = []
  case params[:data]
  when "Romance"
    getMovieTest("Romance")
  when "Magic"
    getMovieTest("Magic", "Thriller")
  when "Mystery"
    getMovieTest("Mystery")
  when "Comedy"
    getMovieTest("Comedy")
  when "Sci-Fi"
    getMovieTest("Sci-Fi")
  when "Action"
    getMovieTest("Action")
  when "Adventure"
    getMovieTest("Adventure")
  else

  end
  @token = @@anime[0].token
  @ename = @@anime[0].e_title
  @jname = @@anime[0].j_title
  @youtube = @@anime[0].Youtube
  p @youtube
  @vid = sendTrailer(@token, @youtube)
 end
 
 # def romance
 #  @@anime = []
 #  getMovieTest("Romance")
 #  # @@anime.shuffle
 #  @token = @@anime[0].token
 #  @ename = @@anime[0].e_title
 #  @jname = @@anime[0].j_title
 #  @youtube = @@anime[0].Youtube
 #  @vid = sendTrailer(@token)
 #  render :search
 # end
 
 # def magic
 #  @@anime = []
 #  getMovieTest("Magic", "Thriller")
 #  # @@anime.shuffle
 #  @token = @@anime[0].token
 #  @ename = @@anime[0].e_title
 #  @jname = @@anime[0].j_title
 #  @youtube = @@anime[0].Youtube
 #  @vid = sendTrailer(@token)
 #  render :search
 # end

 # def mystery
 #  @@anime = []
 #  getMovieTest("Mystery")
 #  # @@anime.shuffle
 #  @token = @@anime[0].token
 #  @ename = @@anime[0].e_title
 #  @jname = @@anime[0].j_title
 #  @youtube = @@anime[0].Youtube
 #  @vid = sendTrailer(@token)
 #  render :search
 # end

 # def comedy
 #  @@anime = []
 #  getMovieTest("Comedy")
 #  # @@anime.shuffle
 #  @token = @@anime[0].token
 #  @ename = @@anime[0].e_title
 #  @jname = @@anime[0].j_title
 #  @youtube = @@anime[0].Youtube
 #  @vid = sendTrailer(@token)
 #  render :search
 # end

 # def scifi
 #  @@anime = []
 #  getMovieTest("Sci-Fi")
 #  @@anime.shuffle
 #  @token = @@anime[0].token
 #  @ename = @@anime[0].e_title
 #  @jname = @@anime[0].j_title
 #  @youtube = @@anime[0].Youtube
 #  @vid = sendTrailer(@token)
 #  render :search
 # end

 # def action
 #  @@anime = []
 #  getMovieTest("Action")
 #  # @@anime.shuffle
 #  @token = @@anime[0].token
 #  @ename = @@anime[0].e_title
 #  @jname = @@anime[0].j_title
 #  @youtube = @@anime[0].Youtube
 #  @vid = sendTrailer(@token)
 #  render :search
 # end

 # def adventure
 #  @@anime = []
 #  getMovieTest("Adventure")
 #  # @@anime.shuffle
 #  @token = @@anime[0].token
 #  @ename = @@anime[0].e_title
 #  @jname = @@anime[0].j_title
 #  @youtube = @@anime[0].Youtube
 #  @vid = sendTrailer(@token)
 #  render :search
 # end
 
 def getMovie
  
  @all = Anime.count
  r = rand(@all)
  if r==0 then r = rand(@all) end
  an = Anime.find(r)
  return an

 end

 def getMovieTest(*args)
    @all = Anime.count
    p @all
    @@anime = Anime.where(["genre1 IN (:args) OR genre2 IN (:args) OR genre3 IN (:args) OR genre4 IN (:args) OR genre5 IN (:args)", {args: args}]).shuffle
  end

  def sendTrailer(token, youtube)
    @response = HTTParty.get("http://hummingbird.me/api/v2/anime/#{token}.json", headers:{'X-Client-Id'=> AUTH})
    if(youtube == "" ||youtube == nil) then
      @vid = "https://www.youtube.com/embed/#{@response.parsed_response['anime']['youtube_video_id']}?autoplay=1&amp;&showinfo=0&amp;rel=0&amp;controls=0&amp;showinfo=0"
     else
       @vid = "https://www.youtube.com/embed/#{youtube}?autoplay=1&amp;&showinfo=0&amp;rel=0&amp;controls=0&amp;showinfo=0"
     end
     return @vid
  end

end
