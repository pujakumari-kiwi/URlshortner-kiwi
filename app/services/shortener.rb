require 'digest/sha2'

class Shortener

 attr_reader :url, :link_model

 def initialize(url, link_model = Link)
 @url = url
 @link_model = link_model
 end

 def generate_short_link
 link_model.create(original_url: url, lookup_code: lookup_code)
 end

 def lookup_code

 loop do
 
 break get_fresh_code unless link_model.exists?(lookup_code: get_fresh_code)
 # if use i++ -> bug
 i = i + 1
 end
 end

 private

 def get_fresh_code
 SecureRandom.uuid[0..6]
 end 
end