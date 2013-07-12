# -*- encoding: utf-8 -*-
require 'rubygems'
require 'sinatra'
require 'twitter'
require 'thin'
require 'twitter'

load 'config.rb'

get '/' do
    "Hello World!"
end

post MAIL do
    message = params
    subject = message["subject"]
    return unless subject && (subject.include?("休講") || subject.include?("教室変更"))
    twitter = Twitter::Client.new(
        :consumer_key => CONSUMER_KEY,
        :consumer_secret => CONSUMER_SECRET,
        :oauth_token => ACCESS_TOKEN,
        :oauth_token_secret => ACCESS_TOKEN_SECRET
    )   
    twitter.update(message["body-plain"]) if(message["body-plain"])
end
