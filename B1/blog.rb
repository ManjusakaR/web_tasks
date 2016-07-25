require 'sinatra'
require 'erb'
require 'date'

$blog_a=Array.new
$b_search=Array.new

class Blog
  @@b_id=0
  @id=0
  @message=''
  @author=''
  @created_at=Time.new

  def initialize( msg, aut)
    @id=@@b_id
    @@b_id+=1
    @message=msg
    @author=aut
    @created_at=Time.now
  end

  def get_id
    @id
  end

  def get_message
    @message
  end

  def get_author
    @author
  end

  def get_time
    @created_at
  end

  def Blog.add_blog(b_new)
    blog_new=[[b_new.get_id,b_new.get_message,b_new.get_author,b_new.get_time]]
  end

  def Blog.search_by_id(id,blog_a)
    b_id=Array.new
    blog_a.each{ |ba|
      if id==ba[0]
        b_id=ba
        break
      end
      }
      b_id
  end

  def Blog.search_by_author(aut,blog_a)
    b_aut=Array.new
    blog_a.each{ |ba|
      if aut==ba[2]
        b_aut=ba
        break
      end
    }
    b_aut
  end

  def Blog.delete_blog(id,blog_a)
        blog_a.each{ |ba|
          if id==ba[0]
            blog_a.delete(ba)
            break
          end
        }
      blog_a
  end

end

get '/' do
  redirect to('show')
end

get '/show' do
  $blog_a
  erb :show
end

post '/show' do
  id=params[:id]
  author=params[:author]
  if id!=""
    $b_search=Blog.search_by_id(id.to_i,$blog_a)
  elsif author!=""
    $b_search=Blog.search_by_author(author,$blog_a)
  else
    $b_search=$blog_a
  end
  erb :show
end

get '/add' do
  erb :add
end

post '/add' do
  b_new=Blog.new(params[:message],params[:author])
  $blog_a+=Blog.add_blog(b_new)
  erb :show
end

get '/delete' do
  erb :delete
end

post '/delete' do
  id=params[:id]
  Blog.delete_blog(id.to_i,$blog_a)
  erb :show
end
