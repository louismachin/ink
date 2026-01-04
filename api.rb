get '/api/list' do
    protect!
    tags = params['tags'] ? params['tags'].split(',') : []
    uris = $forest.all_leaves
        .select { |leaf|
            tags.map { |tag| leaf.has_tag?(tag) }.all?
        }.map { |leaf|
            leaf.uri.sub('./', '/api/')
        }
    content_type :json
    { success: true, tags: tags, uris: uris }.to_json
end

get '/api/*.:ext' do
    return pass unless ['leaf', 'branch', 'tree'].include?(params['ext'])
    protect!
    # Get path as parts
    path = params['splat'].first + '.' + params['ext']
    parts = path.split('/')
    # Categorize parts
    tree, leaf = parts[0], parts[-1]
    branches = parts.length > 2 ? parts[1..-2] : []
    # Build traversal path of IDs
    traversal = []
    traversal << tree + '.tree' unless tree == leaf
    branches.each { |branch| traversal << branch + '.branch' }
    traversal << leaf if leaf
    # Traverse and cast last part as a leaf
    iota = $forest
    traversal[0..-2].each do |id|
        puts "Finding [id=\"#{id}\"]..."
        iota = iota.find(id)
    end
    leaf = iota.find_leaf(traversal[-1])
    content_type :json
    if leaf
        { success: true, attributes: leaf.attributes, body: leaf.body }.to_json
    else 
        { success: false }.to_json
    end
end
