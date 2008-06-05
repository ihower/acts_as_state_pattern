= Acts as State Pattern

== Description
Acts as state pattern is a Rails plugin to implement state pattern using mixology gem, 
which mixin/unmix module when you change state.

== Install
* sudo gem install mixology (see http://www.somethingnimble.com/bliki/mixology)

== Usage
In the model:

  acts_as_state [:foo,:bar]
  
You can add :state_column option if column name is not 'state', add :initial_state option if migration has not default value.

Then we have 
  1 .foo?, bar? methods will return true/false
  2. foo!, bar! methods will change state
  3. model.current_state
  4. Depend on your state column name, `state` and `state=`

Define state module inside your model class when you need:

  module Foo
    def blah
      'foo'
    end
  end
  
  module Bar
    def blah
      'bar
    end
  end

model.blah # 'foo'
model.bar!
model.blah # 'bar'

== Author & License
Author:: Wen-Tien Chang(mailto:ihower@gmail.com)
Copyright:: Copyright (c) 2008 Handlino Inc.
Licensed under the MIT: http://www.opensource.org/licenses/mit-license.php
