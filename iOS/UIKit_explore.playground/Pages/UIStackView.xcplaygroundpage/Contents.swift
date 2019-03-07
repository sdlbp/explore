//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport
//: The exact layout varies depending on the stack view’s `axis`, `distribution`, `alignment`, `spacing`, and other properties.

//: You are responsible for defining the position and (optionally) the size of the stack view. The stack view then manages the layout and size of its content.

//: **For all distributions except the UIStackView.Distribution.fillEqually distribution, the stack view uses each arranged view’s intrinsicContentSize property when calculating its size along the stack’s axis. UIStackView.Distribution.fillEqually resizes all the arranged views so they are the same size, filling the stack view along its axis.** If possible, the stack view stretches all the arranged views to match the view with the longest intrinsic size along the stack’s axis.

//: For all alignments except the UIStackView.Alignment.fill alignment, the stack view uses each arranged view’s intrinsicContentSize property when calculating its size perpendicular to the stack’s axis. UIStackView.Alignment.fill resizes all the arranged views so that they fill the stack view perpendicularly to its axis. If possible, the stack view stretches all the arranged views to match the view with the largest intrinsic size perpendicular to the stack’s axis.

//: The UIStackView is a nonrendering subclass of UIView; that is, it does not provide any user interface of its own. **Instead, it just manages the position and size of its arranged views**. As a result, some properties (like backgroundColor) have no effect on the stack view. Similarly, you cannot override layerClass, draw(_:), or draw(_:in:).

//: You can also fine tune an arranged view’s appearance by adding additional constraints to the arranged view. For example, you can use constraints to set a minimum or maximum height or width for the view. Or you can define an aspect ratio for the view. The stack view uses these constraints when laying out its content. For example, in the image view has an aspect ratio constraint that enforces a constant aspect ratio as the image is resized.


func randomColorView(frame: CGRect = CGRect.zero) -> UIView{
    let v = UIView(frame: frame)
    let red = CGFloat(arc4random()%256)/255.0
    let green = CGFloat(arc4random()%256)/255.0
    let blue = CGFloat(arc4random()%256)/255.0
    v.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1);
    return v
}

func makeLabel(text: String, randomColor: Bool = false) -> UILabel{
    let v = UILabel()
    v.textAlignment = .center
    v.numberOfLines = 0
    if randomColor {
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        v.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1);
    }
    v.text = text
    return v
}

let backgroud: UIView = {
    let v = UIView.init(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
    v.backgroundColor = UIColor.white
    return v
}()

let resultView: UIStackView = {
    /**
     intrinsicContentSize 探究
     let one = randomColorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
     let two = randomColorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
     let three = randomColorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
     let subviews = [one, two, three]
     subviews.forEach({ (sub) in
     print("subviews \(sub.intrinsicContentSize)")
     })
     subviews.forEach({ (sub) in
     sub.translatesAutoresizingMaskIntoConstraints = false
     NSLayoutConstraint.activate([
     sub.widthAnchor.constraint(equalTo: sub.widthAnchor, constant: 60),
     sub.heightAnchor.constraint(equalTo: sub.heightAnchor, constant: 60)
     ])
     })
     subviews.forEach({ (sub) in
     print("subviews \(sub.intrinsicContentSize)")
     })
     */
    let one = makeLabel(text: "1", randomColor: true)
    let two = makeLabel(text: "1 1", randomColor: true)
    let three = makeLabel(text: "1 1 1 1 \n 1 1 1 1", randomColor: true)
    let subviews = [one, two, three]
    let v = UIStackView.init(arrangedSubviews: subviews)
    v.frame = CGRect(x: 0, y: 0, width: 600, height: 300)
    v.axis = .vertical
    v.spacing = 10
    
    v.distribution = .fillEqually
    v.alignment = .fill
    v.isLayoutMarginsRelativeArrangement = true
    return v
}()

class segment {
    private weak var stack: UIStackView?
    
    init(stack: UIStackView) {
        self.stack = stack
    }
    
    @objc func didClickButton(sender: UIButton){
        guard let stack = self.stack else {
            return
        }
        switch sender {
        case addButton:
            stack.addArrangedSubview(makeLabel(text: "\(stack.arrangedSubviews.count + 1)", randomColor: true))
        case delButton:
            if stack.arrangedSubviews.count > 1 {
                stack.removeArrangedSubview(stack.arrangedSubviews.last!)
            }
        default:
            print("")
        }
        print("stackview subviews count\(stack.subviews.count)")
    }
    
    @objc func segmentedChange(sender: UIStackView){
        guard let stack = self.stack else {
            return
        }
        switch sender {
        case axisSeg:
            stack.axis = NSLayoutConstraint.Axis(rawValue: axisSeg.selectedSegmentIndex)!
        case alignmentSeg where alignmentSeg.selectedSegmentIndex <= 5:
            stack.alignment = UIStackView.Alignment(rawValue: alignmentSeg.selectedSegmentIndex)!
        case alignmentSeg where alignmentSeg.selectedSegmentIndex == 6:
            print("6")
            stack.alignment = UIStackView.Alignment.top
        case alignmentSeg where alignmentSeg.selectedSegmentIndex == 7:
            print("7")
            stack.alignment = UIStackView.Alignment.bottom
        case distributionSeg:
            stack.distribution = UIStackView.Distribution(rawValue: distributionSeg.selectedSegmentIndex)!
        default:
            print("啦啦")
        }
        print("alignment \(stack.alignment.rawValue) distribution \(stack.distribution.rawValue)")
//        stack.arrangedSubviews.forEach { (sub) in
//            print("sub \(sub.intrinsicContentSize)")
//        }
    }
    
    private func makeSegmentedControl(_ items:[String], selected: Int = 0) -> UISegmentedControl {
        let v = UISegmentedControl.init(items: items)
        v.addTarget(self, action: #selector(segmentedChange), for: .valueChanged)
        v.selectedSegmentIndex = selected
        return v
    }
    
    private func makeButton(text: String) -> UIButton{
        let v = UIButton(type: .custom)
        v.setTitle(text, for: .normal)
        v.addTarget(self, action: #selector(didClickButton(sender:)), for: .touchUpInside)
        v.backgroundColor = UIColor.orange
        return v
    }
    
    lazy var axisSeg: UISegmentedControl = makeSegmentedControl([".horizontal", ".vertical"], selected: 1)

    lazy var distributionSeg: UISegmentedControl = makeSegmentedControl([".fill", ".fillEqually", ".fillProportionally", ".equalSpacing", ".equalCentering"], selected: 1)
    
    lazy var alignmentSeg: UISegmentedControl = makeSegmentedControl([".fill", ".leading",".firstBaseline", ".center", ".trailing", ".lastBaseline", ".top", ".bottom"], selected: 0)
    
    lazy var addButton: UIButton = makeButton(text: "add")
    lazy var delButton: UIButton = makeButton(text: "del")
}

let testView: UIStackView = {
    let v = UIStackView.init(frame: CGRect(x: 0, y: 300, width: 600, height: 300))
    v.axis = .vertical
    v.spacing = 0
    v.distribution = .fillEqually
    v.alignment = .center
    return v
}()

backgroud.addSubview(resultView)
let s = segment(stack: resultView)
testView.addArrangedSubview(makeLabel(text: "axis 排列方向"))
testView.addArrangedSubview(s.axisSeg)
testView.addArrangedSubview(makeLabel(text: "alignment 子控件非轴方向对齐方式"))
testView.addArrangedSubview(s.alignmentSeg)
testView.addArrangedSubview(makeLabel(text: "distribution 子控件轴方向对齐方式"))
testView.addArrangedSubview(s.distributionSeg)
testView.addArrangedSubview(s.addButton)
testView.addArrangedSubview(s.delButton)
backgroud.addSubview(testView)

PlaygroundPage.current.liveView = backgroud

//: [Next](@next)
