//An abstract class
class Ordered{
    //We cannot just declare an empty method we need a body for it
    func preceds(_ other:Ordered) -> Bool { fatalError("Implement Me") }
}

class Number:Ordered{
    var value : Double = 1
    override func preceds(_ other:Ordered) -> Bool{
        return self.value < (other as! Number).value
    }
}


//But What if other is a label

class UILabel:Ordered{
    //Now this is a problem as we cannot use preceds now
}
