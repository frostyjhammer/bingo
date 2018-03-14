class BuzzwordsController < ApplicationController
  def new
  end
  def create
# 'render plain' below from http://guides.rubyonrails.org/getting_started.html
    render plain: params[:buzzword].inspect
#   <ActionController::Parameters {"category"=>"Default", "buzzwords"=>"this\r\nthat\r\the other"} permitted: false>

    p = params[:buzzword]
    c = p['category']
    b = p['buzzwords'].split(/[\r\n]+/)

    puts; puts 'Category: ' + c; puts 'Buzzwords: ' + b.join(','); puts


require 'pg'
  begin
    con = PG.connect :dbname => 'postgres', :user => 'rails_dev', :password => 'Rails-Dev-4'
    puts 'Server Version: ' + con.server_version.to_s.split('0').join('.')

    user = con.user
    db_name = con.db
    pswd = con.pass

    puts "User: #{user}"
    puts "Database name: #{db_name}"
#   puts "Password: #{pswd}"
    puts

    puts "Let's try to write to the database, then!"
##  con.exec "INSERT INTO buzzwords (category, word) VALUES ('Default','Postgresql Rules!')"
##  con.exec "INSERT INTO buzzwords (category, word, created_at, updated_at) VALUES ('Default', 'Postgresql Rules!', Time.now, Time.now)"
    con.exec "INSERT INTO buzzwords (category, word, created_at, updated_at) VALUES ('Default', 'Postgresql Rules!', NOW(), NOW())"
    puts

  rescue PG::Error => e
    puts e.message
  ensure
    con.close if con
  end
end

end
