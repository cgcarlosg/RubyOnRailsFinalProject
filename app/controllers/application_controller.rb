class ApplicationController < ActionController::Base
  include SessionsHelper

  def icons
    %w[ad
       address-card
       anchor
       angry
       apple-alt
       arrows-alt
       atlas
       baby-carriage
       bacon
       bath
       bell
       bible
       book-open
       box
       briefcase
       calculator
       camera
       car
       carrot
       cat
       chair
       church
       clock
       credit-card
       drum
       envelope
       ethernet
       eye
       fan
       fire
       fire-extinguisher
       folder
       football-ball
       guitar
       hamburger
       hammer
       headphones
       home
       horse
       hotdog
       ice-cream
       keyboard
       laptop
       marker
       mobile
       motorcycle
       paint-brush
       pen
       phone
       play
       receipt
       restroom
       ship
       shoe-prints
       shower
       smoking
       store
       suitcase
       table
       tablet
       thermometer
       umbrella
       university
       window-minimize
       wine-glass
       yin-yang]
  end

  private

  def logged_in_user
    return if logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
  end
end
