class HomeController < ApplicationController
  
  AUTH = '936dd662054f71d5c137'
  @@anime = Array.new
  
  def index
  end

 def search
 	# auth = '936dd662054f71d5c137'
 	# @all = Anime.count
 	# r = rand(24)
 	# if r==0 then r = rand(24) end
 	# an = Anime.find(r)
 	# @token = an.token
 	# @ename = an.e_title
 	# @jname = an.j_title
  #  @youtube = an.Youtube
  #  @response = HTTParty.get("http://hummingbird.me/api/v2/anime/#{@token}.json", headers:{'X-Client-Id'=> @auth})
  #  if(@youtube == "" ||@youtube == nil) then
 	#    @vid = "https://www.youtube.com/embed/#{@response.parsed_response['anime']['youtube_video_id']}?autoplay=1&amp;&showinfo=0&amp;rel=0&amp;controls=0&amp;showinfo=0"
  #  else
  #    @vid = "https://www.youtube.com/embed/#{@youtube}?autoplay=1&amp;&showinfo=0&amp;rel=0&amp;controls=0&amp;showinfo=0"
  #  end
 end
 
 def romance
  @@anime = []
  getMovieTest("Romance")
  # @@anime.shuffle
  @token = @@anime[0].token
  @ename = @@anime[0].e_title
  @jname = @@anime[0].j_title
  @youtube = @@anime[0].Youtube
  @vid = sendTrailer(@token)
  render :search
 end
 
 def magic
  @@anime = []
  getMovieTest("Magic", "Thriller")
  # @@anime.shuffle
  @token = @@anime[0].token
  @ename = @@anime[0].e_title
  @jname = @@anime[0].j_title
  @youtube = @@anime[0].Youtube
  @vid = sendTrailer(@token)
  render :search
 end

 def mystery
  @@anime = []
  getMovieTest("Mystery")
  # @@anime.shuffle
  @token = @@anime[0].token
  @ename = @@anime[0].e_title
  @jname = @@anime[0].j_title
  @youtube = @@anime[0].Youtube
  @vid = sendTrailer(@token)
  render :search
 end

 def comedy
  @@anime = []
  getMovieTest("Comedy")
  # @@anime.shuffle
  @token = @@anime[0].token
  @ename = @@anime[0].e_title
  @jname = @@anime[0].j_title
  @youtube = @@anime[0].Youtube
  @vid = sendTrailer(@token)
  render :search
 end

 def scifi
  @@anime = []
  getMovieTest("Sci-Fi")
  @@anime.shuffle
  @token = @@anime[0].token
  @ename = @@anime[0].e_title
  @jname = @@anime[0].j_title
  @youtube = @@anime[0].Youtube
  @vid = sendTrailer(@token)
  render :search
 end

 def action
  @@anime = []
  getMovieTest("Action")
  # @@anime.shuffle
  @token = @@anime[0].token
  @ename = @@anime[0].e_title
  @jname = @@anime[0].j_title
  @youtube = @@anime[0].Youtube
  @vid = sendTrailer(@token)
  render :search
 end

 def adventure
  @@anime = []
  getMovieTest("Adventure")
  # @@anime.shuffle
  @token = @@anime[0].token
  @ename = @@anime[0].e_title
  @jname = @@anime[0].j_title
  @youtube = @@anime[0].Youtube
  @vid = sendTrailer(@token)
  render :search
 end
 
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

  def sendTrailer(token)
    @response = HTTParty.get("http://hummingbird.me/api/v2/anime/#{token}.json", headers:{'X-Client-Id'=> AUTH})
    if(@youtube == "" ||@youtube == nil) then
      @vid = "https://www.youtube.com/embed/#{@response.parsed_response['anime']['youtube_video_id']}?autoplay=1&amp;&showinfo=0&amp;rel=0&amp;controls=0&amp;showinfo=0"
     else
       @vid = "https://www.youtube.com/embed/#{@youtube}?autoplay=1&amp;&showinfo=0&amp;rel=0&amp;controls=0&amp;showinfo=0"
     end
     return @vid
  end

end
