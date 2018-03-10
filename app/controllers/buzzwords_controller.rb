class BuzzwordsController < ApplicationController
  def new
  end
  def create
    vars_vals = params[:buzzword].inspect;
    render plain: vars_vals;
#   <ActionController::Parameters {"category"=>"Default", "buzzwords"=>"this\r\nthat\r\nother"} permitted: false>
  end
end
