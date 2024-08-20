require("example.Class")
require("I")

ExampleClass = Class()

function ExampleClass:init(msg)
  self.msg = msg
end

function ExampleClass:foo()
  I:LogToHud(self.msg)
end
