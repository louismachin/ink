require './models/leaf.rb'
require './models/branch.rb'
require './models/tree.rb'

task :test do
    Dir['./forest/*/*.tree'].each do |filepath|
        tree = Tree.new(filepath)
        puts tree.debug
    end
end
