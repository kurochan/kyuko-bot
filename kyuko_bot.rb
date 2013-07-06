# -*- encoding: utf-8 -*-
require 'rubygems'
require 'sinatra'
require 'twitter'
require 'thin'
require 'twitter'
require 'pp'

load 'config.rb'

get '/' do
    "Hello World!"
end

get MAIL do
#   return nil unless message
    twitter = Twitter::Client.new(
        :consumer_key => CONSUMER_KEY,
        :consumer_secret => CONSUMER_SECRET,
        :oauth_token => ACCESS_TOKEN,
        :oauth_token_secret => ACCESS_TOKEN_SECRET
    )   
    if params[:message].to_s.size > 2
        message = JSON.parse(params[:message])
        twitter.update "received" if message
    else
        twitter.update "not received" unless message
    end
end
