class PagesController < ApplicationController
  def home
    render 'pages/home'#, :layout => false
  end
end
