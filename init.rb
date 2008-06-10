require 'acts_as_state_pattern'

class ActiveRecord::Base
  include Handlino::ActsAsStatePattern
end