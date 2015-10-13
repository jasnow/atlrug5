#!/usr/bin/env ruby

# require 'rubygems'
require 'green_onion'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

GreenOnion.configure do |_c|
  # You can use and customize these configuration options
  # c.skins_dir = "#{::Rails.root}/spec/skins"
  # c.threshold = 100
  # c.dimensions = { :width => 1024, :height => 768 }
  # c.skin_name = {
  #   :match => /[\/]/,
  #   :replace => "_",
  #   :prefix => nil,
  #   :root => "root"
  # }
end

all_routes = Rails.application.routes.routes
routes = all_routes.collect { |r| r.path.spec.to_s.gsub(/\/*(\(\.)*:(\w*)(\))*\/*/, '') }.delete_if(&:empty?)

routes.each do |route|
  GreenOnion.skin_visual_and_percentage('http://localhost:3000' + route)
end
