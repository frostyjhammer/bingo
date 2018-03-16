class BingoCardsController < ApplicationController
  require 'pg'
  def show
    category = 'Default'
    begin
      con = PG.connect :dbname => 'postgres', :user => 'rails_dev', :password => 'Rails-Dev-4'
      sql = "SELECT word FROM buzzwords WHERE category = '#{category}' ORDER BY RANDOM() LIMIT 24"
      res = con.exec(sql)
    rescue PG::Error => e
      puts e.message
    ensure
      con.close if con
    end
    @word1 = res[0]['word']
    @word2 = res[1]['word']
    @word3 = res[2]['word']
    @word4 = res[3]['word']
    @word5 = res[4]['word']
    @word6 = res[5]['word']
    @word7 = res[6]['word']
    @word8 = res[7]['word']
    @word9 = res[8]['word']
    @word10 = res[9]['word']
    @word11 = res[10]['word']
    @word12 = res[11]['word']
    @word13 = res[12]['word']
    @word14 = res[13]['word']
    @word15 = res[14]['word']
    @word16 = res[15]['word']
    @word17 = res[16]['word']
    @word18 = res[17]['word']
    @word19 = res[18]['word']
    @word20 = res[19]['word']
    @word21 = res[20]['word']
    @word22 = res[21]['word']
    @word23 = res[22]['word']
    @word24 = res[23]['word']
  end
end
