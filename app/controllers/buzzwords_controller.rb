class BuzzwordsController < ApplicationController
  require 'pg'
  def new
  end
  def create
    p = params[:buzzword]
    category = p['category']
    words = p['buzzwords'].split(/[\r\n]+/)
    words.each {|w|
      puts 'Category: ' + category + '. Buzzword: ' + w + '.'
      begin
        con = PG.connect :dbname => 'postgres', :user => 'rails_dev', :password => 'Rails-Dev-4'
##      con.exec "INSERT INTO buzzwords (category, word, created_at, updated_at) VALUES ('" + category + "','" + w + "', NOW(), NOW())"
        con.exec "INSERT INTO buzzwords (category, word, created_at, updated_at) VALUES ('#{category}', '#{w}', NOW(), NOW())"
      rescue PG::Error => e
        puts e.message
      ensure
        con.close if con
      end
    }
  end
end
