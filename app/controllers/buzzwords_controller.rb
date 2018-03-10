class BuzzwordsController < ApplicationController
  def new
  end
  def create
    render plain: params[:buzzword].inspect

    p = params[:buzzword]
    c = p['category']
    b = p['buzzwords'].split(/[\r\n]+/)

    puts 'Category: ' + c
    puts 'Buzzwords: ' + b.join(',')
#   <ActionController::Parameters {"category"=>"Default", "buzzwords"=>"this\r\nthat\r\nother"} permitted: false>
  end
end
