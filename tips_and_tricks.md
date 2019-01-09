To find out the current state of the app use `debugger`. It will open a `byebug` prompt in the console. To release the prompt and continue execution of the application, press Ctrl-D. Example:
```ruby
def show
  @user = User.find(params[:id])
  debugger
end
```

The `flash.now` method is used for flash messages on rendered pages.
