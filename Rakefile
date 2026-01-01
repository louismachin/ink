task :test do
    require './models/leaf.rb'
    require './models/branch.rb'
    require './models/tree.rb'
    require './models/forest.rb'
    forest = Forest.new
    puts forest.debug
end

task :run do
    require './server.rb'
    Sinatra::Application.run!
end