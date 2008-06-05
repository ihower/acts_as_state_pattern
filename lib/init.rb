require 'acts_as_state_pattern'
ActiveRecord::Base.send(:extend, Handlino::ActsAsStatePattern)