class Forest < Tree
    attr_reader :trees

    def initialize(filepath = './forest')
        super
        @dir = filepath if Dir.exist?(filepath)
        reload
    end

    def title
        return 'Root'
    end

    def reload
        @trees = []
        @branches = []
        @leaves = []
        load_trees
        load_branches
        load_leaves
    end

    def load_trees
        Dir[@dir + '/*/*.tree'].each do |filepath|
            @trees << Tree.new(filepath)
        end
    end

    def all_leaves
        result = []
        @trees.each { |tree| result += tree.all_leaves }
        @branches.each { |branch| result += branch.all_leaves }
        result += @leaves
        return result
    end

    def find(id)
        return find_tree(id) if id.end_with?('.tree')
        return find_branch(id) if id.end_with?('.branch')
        return find_leaf(id) if id.end_with?('.leaf')
        return nil
    end

    def find_tree(id)
        @trees.each { |tree| return tree if tree.id == id }
        return nil
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