

class Prefecture_code < ActiveRecord::Base
  # prefecture_code:integer
  require 'jp_prefecture'

  include JpPrefecture
  jp_prefecture :prefecture_code
end