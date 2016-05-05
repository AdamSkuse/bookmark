ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './models/link'
require_relative './models/tag'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Hello BookmarkManager!'
  end

  get '/links' do
  	@links = Link.all
  	erb :'/links/index'
  end

  get '/links/new' do
    erb :'/links/new'
  end

  post '/links' do
    p link = Link.new(title: params[:link_title], url: params[:link_url])
    p tag = Tag.create(name: params[:link_tags])
    link.tags << tag
    link.save
    redirect('/links')
  end

  get '/tags/:name' do
    tag = Tag.all(name: params[:name])
    @links = tag ? tag.links : []
    erb :'/links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
