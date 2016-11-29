require 'sinatra'
require 'faker'

set :public_folder, Proc.new { File.join(root, 'public') }

helpers do
  def pages
    %w(home about contact blog portfolio project)
  end

  def portfolio_imgs
    Dir[settings.public_folder + "/assets/img/portfolio/*.jpg"].map do |file|
      File.basename file
    end
  end
end

get '/' do
  redirect '/home'
end

get '/assets/*' do |path|
  File.read("#{settings.public_folder}/assets/#{path}")
end

get '/:page' do |page|
  # let's simulate some work on the backend
  sleep 0.5

  erb page.to_sym, layout: :layout, locals: { active_page: page }
end
