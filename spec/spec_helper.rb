# -*- encoding : utf-8 -*-
require 'bundler/setup'

Bundler.require :default, :test

SPEC_ROOT = File.expand_path(File.dirname(__FILE__))
LIB_ROOT = File.expand_path(File.join(SPEC_ROOT, '..', 'lib'))

$: << SPEC_ROOT

require File.join(LIB_ROOT, 'rack-replace-http-accept')
require 'rack/test'

Dir[File.join(SPEC_ROOT, "support/*.rb")].each {|f| require f}
