require 'faraday'
require 'curb'
require 'json'

require "kenshoo/exception"
require "kenshoo/connection"
require "kenshoo/report"
require "kenshoo/configuration"
require "kenshoo/version"

module Kenshoo
  extend Configuration
end
