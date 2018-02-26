require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do

      @team = Team.create(name: params[:team][:name], motto: params[:team][:motto])
      # @team = Team.new(params[:team])

      params[:team][:hero].each do |info|
        Hero.new(info)
      end

      @heros = Hero.all

      erb :team
    end

end
