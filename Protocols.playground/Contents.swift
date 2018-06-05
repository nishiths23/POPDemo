import UIKit
//Start with protocols not with classes

protocol Ordered{
    //The function does not require to have a body
    //Because now we can use static implementation check rather then dynamic check
    func preceds(_ other:Self) -> Bool
}


struct Number:Ordered{
    var value : Double = 1
    func preceds(_ other:Number) -> Bool{
        return self.value < other.value
    }
}























//Lets take one more example
//Suppose you want to add some functionality to UIView
//extension UIView {
//    func paintRed(){
//        self.backgroundColor = .red
//    }
//}











class GreenPaintedUIView:UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        //😱 WHAT!!? why is paint red a part of Green Painted UIView
        paintRed()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}





















//Now every UIView has paint red functionality wather they like it or not
//But what if
protocol RedPaintable{
    func paintRed()
}

extension RedPaintable where Self:UIView{
    func paintRed(){
        self.backgroundColor = .red
    }
}

class RedPaintedUIView:UIView,RedPaintable{
    override init(frame: CGRect) {
        super.init(frame: frame)
        paintRed()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class BluePaintedUIView:UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        paintRed()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

























protocol NibLoadable {
    static var nibName: String { get }
}

extension NibLoadable where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

extension NibLoadable where Self: UIViewController{
    static var nibName: String {
        return String(describing: self)
    }
}

extension UIView{
    func initFromNib<Type:NibLoadable>() -> Type {
        if let view = UINib(nibName: Type.nibName, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? Type{
            return view
        }
        fatalError("Unknown type")
    }
}

extension UIViewController{
    static func initFromNib<Type:NibLoadable>() -> Type where Type:UIViewController{
        return Type(nibName:Type.nibName,bundle:nil)
    }
}

class NibLoadableViewController:UIViewController,NibLoadable{ }

class NonNibLoadable:UIViewController { }

var nibLoadable : NibLoadableViewController = NibLoadableViewController.initFromNib()

var nonNibLoadable = NonNibLoadable(nibName: "NonNibLoadable", bundle: .main)

//var anonNibLoadable = NonNibLoadable.initfro



struct User{
    var name:String = "one"
}

class UserOne{
    var user = User()
}

var a = UserOne()
a.user.name = "two"
var b = a

























