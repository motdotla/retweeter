require 'twitter'

Twitter.configure do |config|
  config.consumer_key       = ENV['CONSUMER_KEY']
  config.consumer_secret    = ENV['CONSUMER_SECRET']
  config.oauth_token        = ENV['OAUTH_TOKEN']
  config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
end

class Retweeter
  def initialize(tweeting_username)
    @tweeting_username  = tweeting_username
    @retweeter_username = Twitter.user.name
  end

  def last_status
    Twitter.user_timeline(@tweeting_username).first
  end

  def last_retweet
    Twitter.retweeted_by(@retweeter_username).first
  end

  def retweet!
    Twitter.retweet(last_status.id) if retweetable?
  end

  private

  def retweetable?
    !text_matches? && !is_reply? && contains_url?
  end

  def text_matches?
    last_status_text == last_retweet_text
  end

  def is_reply?
    last_status_text.include?("@")
  end

  def contains_url?
    last_status_text.include?("http://")
  end

  def last_status_text
    last_status.text
  end

  def last_retweet_text
    last_retweet.text.gsub!("RT @#{@tweeting_username}: ", "")
  end
end
