# -*- encoding: utf-8 -*-
require 'rubygems'
require 'sinatra'
require 'thin'
require 'json'

load 'config.rb'

get '/' do
    "Hello World!"
end

post "#{MAIL}" do
    message = JSON.parse(params[:message]);
#   return nil unless message
    twitter = Twitter::Client.new(
        :consumer_key => CONSUMER_KEY,
        :consumer_secret => CONSUMER_SECRET,
        :oauth_token => ACCESS_TOKEN,
        :oauth_token_secret => ACCESS_TOKEN_SECRET
    )   
    twitter.update "received" if message
    twitter.update "not received" unless message
end
