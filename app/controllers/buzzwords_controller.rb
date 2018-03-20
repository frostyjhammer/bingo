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
    nadded = 0; nupdated = 0
    words.each {|word|
      word = word.strip
      if (word)
        begin
          con = PG.connect :dbname => 'postgres', :user => 'rails_dev', :password => 'Rails-Dev-4'
          sql = "SELECT word FROM buzzwords WHERE category = '#{category}' AND word = '#{word}'"
          res = con.exec(sql)
          puts 'Word "' + res.getvalue(0,0) + '" already in Category "' + category + '"'

          begin
            con.exec "UPDATE buzzwords SET updated_at = NOW() WHERE category = '#{category}' AND word = '#{word}'"
            nupdated += 1
          rescue PG::Error => e
            puts e.message
          end

        rescue

          begin
            con.exec "INSERT INTO buzzwords (category, word, created_at, updated_at) VALUES ('#{category}', '#{word}', NOW(), NOW())"
            nadded += 1
            puts 'Word "' + word + '" added to Category "' + category + '"'
          rescue PG::Error => e
            puts e.message
          end

        ensure
          con.close if con
        end
      end
    }
    puts 'Added ' + number_with_delimiter(nadded.to_s) + ' buzzwords to Category: ' + category + '.' if nadded > 0
    puts 'Updated ' + number_with_delimiter(nupdated.to_s) + ' buzzwords to Category: ' + category + '.' if nupdated > 0
    redirect_to(:new_buzzword, notice: notice)
  end

end
