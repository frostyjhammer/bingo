class BingoCardsController < ApplicationController
  require 'pg'
  def show
    category = 'Abbrev'
    begin
      con = PG.connect :dbname => 'postgres', :user => 'rails_dev', :password => 'Rails-Dev-4'
      sql = "SELECT word FROM buzzwords WHERE category = '#{category}' ORDER BY RANDOM() LIMIT 24"
      res  = con.exec(sql)
    rescue PG::Error => e
      puts e.message
    ensure
      con.close if con
    end
    @word1 = "Buzzword1"
    @word2 = "Buzzword2"
    @word3 = "Buzzword3"
    @word4 = "Buzzword4"
    @word5 = "Buzzword5"
    @word6 = "Buzzword6"
    @word7 = "Buzzword7"
    @word8 = "Buzzword8"
    @word9 = "Buzzword9"
    @word10 = "Buzzword10"
    @word11 = "Buzzword11"
    @word12 = "Buzzword12"
    @word13 = "Buzzword13"
    @word14 = "Buzzword14"
    @word15 = "Buzzword15"
    @word16 = "Buzzword16"
    @word17 = "Buzzword17"
    @word18 = "Buzzword18"
    @word19 = "Buzzword19"
    @word20 = "Buzzword20"
    @word21 = "Buzzword21"
    @word22 = "Buzzword22"
    @word23 = "Buzzword23"
    @word24 = "Buzzword24"
  end
end
