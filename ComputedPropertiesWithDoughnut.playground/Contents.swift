
import Foundation


//We want to track how many doughnuts we are buying, eating and storing with the help of Computed Properties.

struct DoughnutShopwithGet {
    var doughnutCounter = 0
    var eatenDoughnuts = 0
    
    
 // This is a read only computed property where we need to explicitly define its type, in our case Int. 
 // Then in brackets we automatically return the value of doughnutsLeft. 
 // If we want to we can leave the get {} if we do not have a set.
    var doughnutsLeft: Int {
        get {
        return doughnutCounter - eatenDoughnuts
        }
    }
}

// Let`s create a DoughnutShopWithGet object and assign it to the doughnutShop variable.

var doughnutShopWithGet = DoughnutShopwithGet()
// Give values to doughnutCounter and eatenDoughnuts with dot notation so doughnutsLeft can be computed.
doughnutShopWithGet.doughnutCounter = 15
doughnutShopWithGet.eatenDoughnuts = 5
doughnutShopWithGet.doughnutsLeft




// Now let`s see how to use set to set a value of other properties. 
// Do not try to set a computed property in its own setter as it will create an infinite loop. 
// A setter is designed to set the value of other properties.


struct DoughnutShopwithGetSet {
    var doughnutCounter = 0
    var eatenDoughnuts = 0
    var moneySpentOnEatenDoughnuts = 0
    
// We can use a single get with a property but, cannot do this if we only want to use a setter.
// In this case the property needs a getter and a setter.
    var doughnutsLeft: Int {
        get {
            return doughnutCounter - eatenDoughnuts
        }
        //This only gets called if doughnutsLeft has a new value
        set(newDoughnutsLeft) {
            moneySpentOnEatenDoughnuts = newDoughnutsLeft * 2
        }
    }
}
//With struct we get a free memberwise initializer
var doughnutShop = DoughnutShopwithGetSet(doughnutCounter: 15, eatenDoughnuts: 5, moneySpentOnEatenDoughnuts: 0)
doughnutShop.doughnutsLeft
doughnutShop.moneySpentOnEatenDoughnuts
// As you can see that moneySpentOnEatenDoughnuts is still 0, that is, our set will only work when it gets a new value. 
// So if we manually give doughnutsLeft a new value the set will be called and moneySpentOnEatenDoughnuts will be calculated.
doughnutShop.doughnutsLeft = 10
doughnutShop.moneySpentOnEatenDoughnuts

/*
// We can leave out newDoughnutsLeft and use the default value of "newValue" instead which is the new value of doughnutsLeft.
set {
    moneySpentOnEatenDoughnuts = newValue * 2
}
*/


