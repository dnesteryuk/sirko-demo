require 'sinatra'
require 'faker'
require 'dotenv'

Dotenv.load

set :public_folder, Proc.new { File.join(root, 'public') }

set :youtube_video_codes, [
  'Wa7_I_pc0yo',
  'nyJSd6V2DRI',
  'UmBP-jz7CBc',
  'Cx6aGMC6MjU',
  'DKHuEkmsx3M',
  'HktWin_LPf4',
  '4q3sycRJ5bs',
  'zbbK0WOvWII'
]

set :delays, (2..6).to_a.map{|n| n.to_f / 10}

set :project_imgs, Proc.new { read_imgs('/assets/img/project/') }

set :about_imgs, Proc.new { read_imgs('/assets/img/about/') }

enable :sessions

helpers do
  def pages
    %w[home about contact blog video project]
  end

  def random_youtube_code
    settings.youtube_video_codes.sample
  end

  def random_youtube_codes(count = 3)
    settings.youtube_video_codes.shuffle.take(count)
  end

  def random_project_imgs(count = 3)
    settings.project_imgs.shuffle.take(count)
  end

  def random_about_img
    settings.about_imgs.sample
  end

  def random_avatars
    (1..4).to_a.shuffle.map { |n| "avatar#{n}.png" }
  end

  def sirko_engine_url
    ENV.fetch('SIRKO_ENGINE_URL')
  end

  def digitalocean_url
    ENV['DIGITALOCEAN_URL']
  end

  def ga_tracking_id
    ENV['GA_TRACKING_ID']
  end
end

def render_page(page, locals = {})
  # let's simulate some work on the backend
  sleep settings.delays.sample

  erb page.to_sym, layout: :layout, locals: locals.merge!( active_page: page )
end

def dir_children(path)
  Dir.entries(path) - ['.', '..']
end

def read_imgs(path)
  dir_children("#{public_folder}/#{path}").map { |name| path + name }
end

get '/' do
  redirect '/home'
end

get '/sirko_sw.js' do
  content_type 'application/javascript'

  File.read('public/assets/sirko_sw.js')
end

get '/message' do
  render_page('message', message: session[:message])
end

get '/post' do
  render_page('post', comment: nil)
end

get '/:page' do |page|
  render_page(page)
end

post '/contact' do
  session[:message] = params[:message]

  redirect '/message'
end

post '/comment' do
  render_page('post', comment: params[:comment])
end
