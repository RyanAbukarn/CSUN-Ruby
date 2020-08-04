require_relative "shop"

def displayMenu
    puts "--------------------------------------------------"
    puts ""
    puts "type 0:Exit \t\t\t 1:Show store's candies"
    puts "type 2:Add new candy \t\t 3:Add new shelf"
    puts "type 4:Add candy to a shefl \t 5:Remove candy from a shelf"
    puts ""
    puts "\t\t type 6:Remove a shelf "
    puts "--------------------------------------------------"
end

sourPatch = Shop.new("Sour Patch")

loop do
    displayMenu()
    a = gets.to_i
    
    if (a == 0)
        break
    elsif (a == 1)
        sourPatch.displayShop()

    elsif (a == 2)
        puts "Enter a candy name :) "
        name = gets.chomp
        sourPatch.addCandy(Candy.new(name,false))

    elsif (a == 3)
        puts "Enter a shelf name :) "
        name = gets.chomp
        sourPatch.addShelf(Shelf.new(name))

    elsif (a == 4)
        puts "Which candy you want to add (Enter the barcode) :) "
        sourPatch.displayCandies()
        idCandy = gets.chomp
        puts "Enter the shelf barcode to add the candy :) "
        sourPatch.displayShelfs()
        idShelf = gets.chomp
        sourPatch.addCandyToShelf(idShelf,idCandy)

    elsif (a == 5)
        puts "Enter a shelf barcode and the candy barcode to remove the candy from the shelf"
        sourPatch.displayShelfs()
        idShelf = gets.chomp
        idCandy = gets.chomp
        sourPatch.destroyCandyFromShelf(idShelf,idCandy)

    elsif (a == 6)
        sourPatch.displayShelfs()
        puts "Enter the shelf barcode you want to delete :( "
        id = gets.chomp
        sourPatch.destroyShelf(id)
    
    end   
end
