require_relative "candy"
class Shelf
    attr_accessor :shelfName
    attr_reader :candies
    def initialize(shelfName)
        @shelfName = shelfName
        @candies = {}
    end

    def randBarcode
        return rand(1000)
    end

    def addCandy(barcode,candy)
        candy.shelf=true
        @candies[barcode] = candy
    end

    def displayCandies
        puts "Total Candies #{@candies.size()} at #{@shelfName} which are: "
        @candies.each do |barcode,candy|
            puts "\t Barcode: #{barcode}, Name: #{candy.candyName}"
        end
        puts "\t ---------------------"
    end
    def destroyCandy(barcode)
        temp = @candies[barcode]
        @candies.delete(barcode)
        return temp
    end
    def totalCandies
        @candies.size()
    end
end