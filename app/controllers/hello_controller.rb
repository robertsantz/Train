class HelloController < ApplicationController

  def index
    
  end
  
  def say_hello
    render :text => "<h1>Hello World</h1>"
  end  

  def say
    @hello="Hello World"
  end

end
