include Clockwork
require './retweeter'

TWEETING_USERNAME = "scottmotte"

every(10.minutes, 'retweet') do
  Retweeter.new(TWEETING_USERNAME).retweet!
end