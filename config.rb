require 'sinatra'
require 'mysql2'

# データベース接続情報
CLIENT = Mysql2::Client.new(
  host: '*',
  username: '*',
  password: '*',
  database: '*'
)

# ルートへのGETリクエストを処理する
get '/' do
  # Rackの環境変数やリクエストの詳細情報を表示
  puts "Rack ENV: #{env.inspect}"
  puts "GET data: #{params.inspect}"
  puts "POST data: #{request.POST.inspect}"
  puts "COOKIES: #{request.cookies.inspect}"

  erb :index
end
