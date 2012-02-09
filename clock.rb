include Clockwork
require './retweeter'

TWEETING_USERNAME = "scottmotte"

every(5.minutes, 'retweet') do
  Retweeter.new(TWEETING_USERNAME).retweet!
end