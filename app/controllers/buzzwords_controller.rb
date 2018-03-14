class BuzzwordsController < ApplicationController
  require 'pg'
  def new
  end
  def create
# 'render plain' below from http://guides.rubyonrails.org/getting_started.html
    render plain: params[:buzzword].inspect
#   <ActionController::Parameters {"category"=>"Default", "buzzwords"=>"this\r\nthat\r\the other"} permitted: false>

    p = params[:buzzword]
    category = p['category']
    words = p['buzzwords'].split(/[\r\n]+/)

    puts
    puts 'Category: ' + category
    puts 'Buzzwords: ' + words.join(',')
    puts

    begin
      con = PG.connect :dbname => 'postgres', :user => 'rails_dev', :password => 'Rails-Dev-4'
      puts 'Server Version: ' + con.server_version.to_s.split('0').join('.')

      user = con.user
      db_name = con.db
      pswd = con.pass
#     puts "User: #{user}"
#     puts "Database name: #{db_name}"
#     puts "Password: #{pswd}"

      words.each {|w|
        puts "Let's update this buzzword, " + w
        con.exec "INSERT INTO buzzwords (category, word, created_at, updated_at) VALUES ('" + category + "','" + w + "', NOW(), NOW())"
      }

    rescue PG::Error => e
      puts e.message
    ensure
      con.close if con
    end
  end

end
