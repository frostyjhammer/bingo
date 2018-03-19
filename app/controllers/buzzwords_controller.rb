class BuzzwordsController < ApplicationController
  require 'pg'
  include ActionView::Helpers::NumberHelper

  def new
    params.each {|key,value| puts "key=>#{key}"}
  end

  def create
    p = params[:buzzword]
    category = p['category']
    words = p['buzzwords'].split(/[\r\n]+/)
    nwords = 0
    words.each {|word|

      begin
        con = PG.connect :dbname => 'postgres', :user => 'rails_dev', :password => 'Rails-Dev-4'
        sql = "SELECT word FROM buzzwords WHERE category = '#{category}' AND word = '#{word}'"
        res = con.exec(sql)
        puts 'Word ' + res.getvalue(0,0) + ' already in Category ' + category
      rescue

        begin
##        con = PG.connect :dbname => 'postgres', :user => 'rails_dev', :password => 'Rails-Dev-4'
          con.exec "INSERT INTO buzzwords (category, word, created_at, updated_at) VALUES ('#{category}', '#{word}', NOW(), NOW())"
          nwords += 1
          puts 'Word ' + word + ' added to Category ' + category
        rescue PG::Error => e
          puts e.message
##      ensure
##        con.close if con
        end

      ensure
        con.close if con
      end
    }
    notice = 'Added ' + number_with_delimiter(nwords.to_s) + ' buzzwords to Category: ' + category + '.'
    puts notice
    redirect_to(:new_buzzword, notice: notice)
  end

end
