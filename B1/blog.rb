require 'sinatra'
require 'erb'
require 'date'

$blog_a=Array.new
$b_search=Array.new
$msg=''
class Blog
  @@b_id=0
  @id=0
  @message=''
  @author=''
  @created_at=Time.new

  def initialize(msg, aut)
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
    $msg=''
    if b_new.get_author==""&&b_new.get_message.size<10
      $msg='author_name is nil and the length of message is less than 10'
    elsif b_new.get_author==""
      $msg='author_name is nil'
    elsif b_new.get_message.size<10
      $msg='the length of message is less than 10'
    else
      $blog_a+=blog_new=[[b_new.get_id,b_new.get_message,b_new.get_author,b_new.get_time]]
      $b_search=$blog_a
      $msg='add message sucessfilly'
    end
    b_new.get_id
  end

  def Blog.search_by_id(id,blog_a)
    b_id=Array.new
    i=0
    blog_a.each{ |ba|
      if id==ba[0]
        i=1
        b_id+=[ba]
        break
      end
      }
      if i==0
        $msg='no such id can search'
      else
        $msg='success searched'
      end
      b_id
  end

  def Blog.search_by_author(aut,blog_a)
    b_aut=Array.new
    i=0
    blog_a.each{ |ba|
      if aut==ba[2]
        i=1
        b_aut+=[ba]
      end
    }
    if i==0
      $msg='no such author can search'
    else
      $msg='success searched'
    end
    b_aut
  end

  def Blog.delete_blog(id,blog_a)
    num=0
    msg=''
    id.each{ |b|
        blog_a.each{ |ba|
          if b[1].to_i==ba[0]
            num+=1
            blog_a.delete(ba)
            break
          end
        }
      }
      if num==0
        $msg='Warning, No such message here you can delete!'
      else
        $msg="You success to delete #{num} message/s."
      end
  end

end

get '/' do
  redirect to('show')
end

get '/show' do
  $msg=''
  $b_search=$blog_a
  $msg='All message'
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
    $msg='All message'
    $b_search=$blog_a
  end
  $b_search
  erb :show
end

get '/add' do
  erb :add
end

post '/add' do
  b_new=Blog.new(params[:message],params[:author])
  $b_id=Blog.add_blog(b_new)
  $blog_a
  $b_search
  erb :show
end

get '/delete' do
  erb :delete
end

post '/delete' do
  id=params
  $msg=Blog.delete_blog(id.to_a,$blog_a)
  erb :show
end
