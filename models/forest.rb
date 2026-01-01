class Forest < Tree
    attr_reader :trees

    def initialize(filepath = './forest')
        super
        @dir = filepath if Dir.exist?(filepath)
        @trees = []
        load_trees
    end

    def load_trees
        Dir[@dir + '/*/*.tree'].each do |filepath|
            @trees << Tree.new(filepath)
        end
    end

    def debug
        return [
            "forest=\"#{self.title}\" (#{@filepath})",
            @trees.map { |branch| branch.debug },
            @branches.map { |branch| branch.debug },
            @leaves.map { |leaf| leaf.debug },
        ]
    end
end