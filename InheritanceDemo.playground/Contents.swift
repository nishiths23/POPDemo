import Foundation

class Vehicle:NSObject{
    var movable = true
}

class Car:Vehicle{
    var seatingCapacity: Int { return 4 }
    var type : String { return description }
}

class SUV:Car{
    override var seatingCapacity : Int { return 7 }
}

class HatchBack:Car{
    override var seatingCapacity : Int { return 4 }
}









//Anyone spot any problems with this?























//Lets look at the implementation of NSObject
