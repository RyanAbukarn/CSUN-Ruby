class Candy
    attr_accessor :candyName, :shelf
    def initialize(candyName,shelf)
        @candyName = candyName
        @shelf = shelf
    end

    def displayCandy
        if @shelf
        "#{candyName()} is in a shelf"
        else
        "#{candyName()}  is not in any shelfs"
        end  
    end
end