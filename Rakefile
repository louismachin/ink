task :test do
    require './models/ink.rb'
    Dir['./data/*.ink'].each do |filepath|
        puts "Inspecting \"#{filepath}\""
        ink = Ink.new(filepath)
        puts ink.debug
    end
end