To find out the current state of the app use `debugger`. It will open
a `byebug` prompt in the console. To release the prompt and continue
execution of the application, press Ctrl-D. Example:
```ruby
def show
  @user = User.find(params[:id])
  debugger
end
```

The `flash.now` method is used for flash messages on rendered pages.

Before deploying to Heroku, it’s worth noting that the application
will briefly be in an invalid state after pushing but before the
migration is finished. On a production site with significant traffic,
it’s a good idea to turn maintenance mode on before making the
changes:
```
$ heroku maintenance:on
$ git push heroku
$ heroku run rails db:migrate
$ heroku maintenance:off
```
