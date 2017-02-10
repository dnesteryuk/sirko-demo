require 'sinatra'
require 'faker'
require 'dotenv'

Dotenv.load

set :public_folder, Proc.new { File.join(root, 'public') }

set :youtube_video_codes, [
  'A60nxws_iVs',
  'iJ9hS54BRag',
  'U8ZGVx1NmQg',
  '1l3U1X3z0CE',
  'xMFs9DTympQ',
  'mjzmUUQWqco',
  'U2kCjkxPMuM',
  '6t2JRKTCYbI',
  'M2muJu-FQfI',
  'OxhTQdcieQE'
]

helpers do
  def pages
    %w(home about contact blog video project)
  end

  def random_youtube_code
    settings.youtube_video_codes.sample
  end

  def random_youtube_codes(count = 3)
    settings.youtube_video_codes.shuffle.take(count)
  end

  def random_avatars
    (1..4).to_a.shuffle.map { |n| "avatar#{n}.png" }
  end

  def sirko_engine_url
    ENV.fetch('SIRKO_ENGINE_URL')
  end

  def ga_tracking_id
    ENV['GA_TRACKING_ID']
  end

  def mixpanel_token
    ENV['MIXPANEL_TOKEN']
  end
end

get '/' do
  redirect '/home'
end

get '/:page' do |page|
  # let's simulate some work on the backend
  sleep 0.5

  erb page.to_sym, layout: :layout, locals: { active_page: page }
end
