  module FooBar
    module InnerFooBar
        class Baz
          def mike 
            puts '4'
          end
        end
     end
   end



x = FooBar::InnerFooBar::Baz.new

print x.mike
