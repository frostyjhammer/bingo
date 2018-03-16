class BuzzwordsController < ApplicationController
  require 'pg'
  include ActionView::Helpers::NumberHelper

  def new
  end

  def create
    p = params[:buzzword]
    category = p['category']
    words = p['buzzwords'].split(/[\r\n]+/)
    nwords = 0
    words.each {|w|
      puts 'Category: ' + category + '. Buzzword: ' + w + '.'
      nwords += 1
      begin
        con = PG.connect :dbname => 'postgres', :user => 'rails_dev', :password => 'Rails-Dev-4'
        con.exec "INSERT INTO buzzwords (category, word, created_at, updated_at) VALUES ('#{category}', '#{w}', NOW(), NOW())"
      rescue PG::Error => e
        puts e.message
        nwords -= 1
      ensure
        con.close if con
      end
    }
    puts 'Added: ' + number_with_delimiter(nwords.to_s)
  end

end
