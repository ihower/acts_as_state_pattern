require 'mixology'
module Handlino
  module ActsAsStatePattern

    def self.included(base)
      base.send(:extend, ClassMethods)
    end

    module ClassMethods

      def acts_as_state( states, options={})

        include InstanceMethods
        class_inheritable_accessor :state_column
        class_inheritable_accessor :default_state

        self.default_state = options[:default_state].to_s
        self.state_column = ( options[:state_column] || 'state' ).to_s
        hosting_model = self.to_s

        states.each do |state_name|
          define_method("#{state_name}?") do
            self.read_attribute(self.state_column) == state_name.to_s
          end

          define_method("#{state_name}!") do

            unmix_module_name = "#{hosting_model}/#{attributes[self.state_column]}".camelcase
            mixin_module_name = "#{hosting_model}/#{state_name.to_s}".camelcase

            unmix(unmix_module_name.constantize) if self.class.const_defined?(self.current_state.camelcase)

            self.write_attribute(self.state_column, state_name.to_s )
            @current_state = state_name.to_s

            mixin(mixin_module_name.constantize) if self.class.const_defined?(state_name.to_s.camelcase)
          end
        end

        define_method(self.state_column) do
          self.read_attribute(self.state_column) || self.default_state
        end

        define_method("#{self.state_column}=") do |state_name|
          self.send("#{state_name.to_s}!")
        end

        validates_presence_of self.state_column
        validates_inclusion_of self.state_column, :in => states.map{ |s| s.to_s }
      end

    end

    module InstanceMethods
      def current_state
        @current_state = self.read_attribute(self.state_column)  || self.default_state
      end

      def current_state=(state_name)
        self.send("#{state_name}!")
      end

      def after_initialize
        self.send("#{self.current_state}!") if self.current_state
      end
     
    end
  end
end
