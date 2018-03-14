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
    con = PG.connect :dbname => 'bingo_test', :user => 'rails_dev'
    puts 'Server Version: ' + con.server_version.to_s
  rescue PG::Error => e
    puts e.message
  ensure
    con.close if con
  end
end

end
