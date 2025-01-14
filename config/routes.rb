Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index"})

  get("/users", { :controller => "users", :action => "index"})
  get("/users/:a_user", { :controller => "users", :action => "show"})
  post("/add_user", { :controller => "users", :action => "create"})
  post("/update_user/:a_user", { :controller => "users", :action => "update"})

  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:a_photo", { :controller => "photos", :action => "show"})
  get("/delete_photo/:a_photo", { :controller => "photos", :action => "destroy"})
  post("/add_photo", { :controller => "photos", :action => "create"})
  post("/update_photo/:a_photo", { :controller => "photos", :action => "update"})
  post("/add_comment", { :controller => "photos", :action => "add_comment"})
  
end
