require 'sinatra'
require 'erb'
require 'date'
require './blog'

get '/' do
  $b_search=$blog_a
  $msg='All message'
  erb :show
end

get '/show' do
  id=params[:id]
  author=params[:author]
  puts id
  if id!=""
    $b_search=Blog.search_by_id(id.to_i,$blog_a)
  elsif author!=""
      $b_search=Blog.search_by_author(author,$blog_a)
  else
    $msg='All message'
    $b_search=$blog_a
  end
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
