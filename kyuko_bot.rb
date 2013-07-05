# -*- encoding: utf-8 -*-
require 'rubygems'
require 'sinatra'
require 'thin'

get '/' do
    "Hello World!"
end
