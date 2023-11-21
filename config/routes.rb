Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index"})
  get("/users/:a_user", { :controller => "users", :action => "show"})

end
