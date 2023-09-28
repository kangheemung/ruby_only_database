require 'mysql2'
require_relative 'config'
class Post 
    attr_accessor :title,:body
    CLIENT = Mysql2::Client.new(
    host: '*',
    username: '*',
    password: '*',
    database: '*'
)
    def initialize(params={})
        @title=params[:title]
        @body=params[:body]
        #代入確認のためputs
        puts @title,@body
        self#data入れられました。
    end
    def self.create
        post=Post.new(title: "title from post now",body: "body from post now")
        post.save
        post
    end
    def save
        sql = "INSERT INTO posts (title, body) VALUES ('#{@title}', '#{@body}')"
        # Execute the SQL statement directly to insert the values into the lessons table
        CLIENT.query(sql)
    end
   
    def self.all
        results = CLIENT.query('SELECT * FROM posts')
        results.each do |row|
          puts row['title']
      end
    end
  
end
post=Post.create
post.save
Post.all
#initializeメソットの確認のため以下で実行
#saveメソットのテスト