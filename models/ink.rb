ATTR_START = '---'
ATTR_END = '---'

class Ink
    def initialize(filepath)
        @filepath = filepath
        load_from_file(filepath)
    end

    def load_from_file(filepath)
        @raw = File.readlines(filepath).map(&:chomp)
        @attributes = {}
        if @raw.first == ATTR_START
            ix = 1
            until @raw[ix] == ATTR_END
                key, value = @raw[ix].split(': ')
                @attributes[key] = value
                ix += 1
            end
            until (@raw[ix] != ATTR_END) && (@raw[ix] != '')
                ix += 1
            end
            @body = @raw[ix..-1]
        else
            @body = @raw
            set_attr('title', 'untitled')
        end
    end

    def save_to_file(filepath = nil)
        filepath = @filepath unless filepath
        output = []
        output << ATTR_START
        @attributes.each do |key, value|
            output << "#{key}: #{value}"
        end
        output << ATTR_END
        output += @body
        File.write(filepath, output.join("\n"))
    end


    def set_attr(key, value, and_save = true)
        @attributes[key] = value
        save_to_file if and_save
    end

    def debug
        return [@attributes.inspect, @body.inspect]
    end
end