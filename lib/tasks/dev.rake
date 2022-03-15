desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  
  alice = User.new
  alice.email = "alice@example.com"
  alice.password = "password"
  alice.save

  20.times do 
      task = Task.new
      task.user_id = alice.user_id
      task.status = ["not yet started"].sample
      task.body = "hello"
      task.save
  end

end
