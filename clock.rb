include Clockwork
require './retweeter'

TWEETING_USERNAME = "scottmotte"

every(2.minutes, 'retweet') do
  Retweeter.new(TWEETING_USERNAME).retweet!
end