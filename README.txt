= Acts as State Pattern

== Description
Acts as state pattern is a Rails plugin to implement state pattern using mixology gem, 
which mixin/unmix module when you change state.

== Requirement
* sudo gem install mixology (see http://www.somethingnimble.com/bliki/mixology)

== Usage
In the model:

  acts_as_state [:foo,:bar]
  
You can add :state_column option if column name is not 'state', add :initial_state option if migration does not specify default value.
Then we have these method:

1. @model.foo?, @model.bar? return true or false
2. @model.foo!, @model.bar! change model state
3. @model.current_state
4. Depend on your state column name, `@model.state` and `@model.state=`

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

@model.foo!
@model.blah # 'foo'
@model.bar!
@model.blah # 'bar'

== Author & License
Author:: Wen-Tien Chang(mailto:ihower@gmail.com)
Copyright:: Copyright (c) 2008 Handlino Inc.
Licensed under the MIT: http://www.opensource.org/licenses/mit-license.php
