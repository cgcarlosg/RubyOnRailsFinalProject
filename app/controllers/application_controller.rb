class ApplicationController < ActionController::Base
  include SessionsHelper

  def authorize
    redirect_to login_path, alert: 'Not Authorised ' if current_user.nil?
  end

  def icons
    %w[ad
       address-card
       anchor
       angle-up
       angry
       apple-alt
       arrow-alt-circle-down
       arrows-alt
       asterisk
       atlas
       baby-carriage
       bacon
       barcode
       bath
       bell
       bible
       binoculars
       blog
       bong
       book-open
       box
       briefcase
       building
       calculator
       camera
       candy-cane
       car
       carrot
       cat
       chair
       child
       church
       clock
       cocktail
       coffee
       cookie
       credit-card
       dove
       drum
       envelope
       ethernet
       eye
       fan
       fax
       file
       fire
       fire-extinguisher
       first-aid
       flag
       folder
       football-ball
       futbol
       gamepad
       glasses
       globe
       guitar
       hamburger
       hammer
       hand-scissors
       headphones
       headset
       home
       horse
       hospital
       hotdog
       hotel
       ice-cream
       keyboard
       laptop
       lemon
       marker
       mask
       medal
       microphone
       mobile
       motorcycle
       music
       paint-brush
       paperclip
       pen
       phone
       play
       pray
       print
       receipt
       restroom
       robot
       ruler
       ship
       shoe-prints
       shower
       smoking
       stamp
       star
       store
       subway
       suitcase
       surprise
       table
       tablet
       thermometer
       tractor
       umbrella
       university
       user
       walking
       wallet
       window-minimize
       wine-glass
       yin-yang]
  end

  private

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end
end
