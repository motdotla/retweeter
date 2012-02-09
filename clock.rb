include Clockwork
require './retweeter'
every(2.minutes, 'retweet') do
  Retweeter.new(TWEETING_USERNAME).retweet!
end