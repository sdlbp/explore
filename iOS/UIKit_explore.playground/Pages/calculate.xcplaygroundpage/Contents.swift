//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport

var hostView: UIView = {
    let v = UIView(frame: CGRect(x: 0, y: 0, width: 360, height: 640))
    v.backgroundColor = UIColor.black
    return v
}()

PlaygroundPage.current.liveView = hostView

var backgroudImage: UIImageView = {
    let v = UIImageView(image: UIImage(imageLiteralResourceName: "calculator.png"))
    v.frame = hostView.frame
    v.contentMode = .scaleAspectFit
//    v.isHidden = true
    return v
}()

func creatStackView(axis: NSLayoutConstraint.Axis,
                    spacing: CGFloat = 0,
                    distribution: UIStackView.Distribution = .fillEqually,
                    alignment: UIStackView.Alignment = .fill,
                    subviews: [UIView]) -> UIStackView {
    let v = UIStackView(arrangedSubviews: subviews)
    v.axis = axis
    v.spacing = spacing
    v.distribution = distribution
    v.alignment = alignment
    return v
}

func creatButton(background: UIColor,titleColor: UIColor,title: String, select: String? = nil, defaultConstraints: Bool = true) -> UIButton{
    let size: CGFloat = 75.0
    let v = UIButton()
    v.backgroundColor = background
    v.backgroundColor = .red
    v.layer.cornerRadius = size / 2
    v.layer.masksToBounds = true
    v.setTitleColor(titleColor, for: .normal)
    v.setTitle(title, for: .normal)
    v.titleLabel?.font = UIFont.systemFont(ofSize: 26)
    v.alpha = 0.5
    if let s = select {
        v.setTitle(s, for: .selected)
    }
    v.translatesAutoresizingMaskIntoConstraints = false
    if defaultConstraints {
        NSLayoutConstraint.activate([
            v.widthAnchor.constraint(equalToConstant: size)
            ])
    }
    NSLayoutConstraint.activate([
        v.heightAnchor.constraint(equalToConstant: size)
        ])
    return v
}

let equal = creatButton(background: .orange, titleColor: .white, title: "=", defaultConstraints: false)
let plus  = creatButton(background: .orange, titleColor: .white, title: "+")
let minus = creatButton(background: .orange, titleColor: .white, title: "-")
let times = creatButton(background: .orange, titleColor: .white, title: "×")
let divide = creatButton(background: .orange, titleColor: .white, title: "÷")

let ac    = creatButton(background: .lightGray, titleColor: .black, title: "AC")
let zhengfuhao = creatButton(background: .lightGray, titleColor: .black, title: "±")
let baifenhao = creatButton(background: .lightGray, titleColor: .black, title: "%")

let zero  = creatButton(background: .black, titleColor: .white, title: "0", defaultConstraints: false)
zero.contentHorizontalAlignment = .leading
zero.contentEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
let dot   = creatButton(background: .black, titleColor: .white, title: ".", defaultConstraints: false)
let one   = creatButton(background: .black, titleColor: .white, title: "1")
let two   = creatButton(background: .black, titleColor: .white, title: "2")
let three = creatButton(background: .black, titleColor: .white, title: "3")
let four  = creatButton(background: .black, titleColor: .white, title: "4")
let five  = creatButton(background: .black, titleColor: .white, title: "5")
let six   = creatButton(background: .black, titleColor: .white, title: "6")
let seven = creatButton(background: .black, titleColor: .white, title: "7")
let eight = creatButton(background: .black, titleColor: .white, title: "8")
let nine  = creatButton(background: .black, titleColor: .white, title: "9")

hostView.addSubview(backgroudImage)

let spacing:CGFloat = 11
let oneRowStack = creatStackView(axis: .horizontal,
                                 spacing:spacing,
                                 distribution: .fill,
                                 alignment: .fill,
    subviews: [zero, dot, equal])

NSLayoutConstraint.activate([
    dot.widthAnchor.constraint(equalToConstant: 75),
    equal.widthAnchor.constraint(equalToConstant: 75),
    zero.widthAnchor.constraint(equalToConstant: 160),
    ])

let twoRowStack = creatStackView(axis: .horizontal,
                                 spacing:spacing,
                                 distribution: .fillEqually,
                                 alignment: .center,
                                 subviews: [one, two, three, plus])
let threeRowStack = creatStackView(axis: .horizontal,
                                   spacing:spacing,
                                   distribution: .fillEqually,
                                   alignment: .center,
                                   subviews: [four, five, six, minus])
let fourRowStack = creatStackView(axis: .horizontal,
                                  spacing:spacing,
                                  distribution: .fillEqually,
                                  alignment: .center,
                                  subviews: [seven, eight, nine, times])
let fiveRowStack = creatStackView(axis: .horizontal,
                                  spacing:spacing,
                                  distribution: .fillEqually,
                                  alignment: .center,
                                  subviews: [ac, zhengfuhao, baifenhao, divide])

let containerStack = creatStackView(axis: .vertical,
                                    spacing:spacing,
                                    distribution: .fillEqually,
                                    alignment: .center,
                                    subviews: [fiveRowStack, fourRowStack, threeRowStack, twoRowStack, oneRowStack]) // [fiveRowStack, fourRowStack, threeRowStack, twoRowStack, oneRowStack]
hostView.addSubview(containerStack)
containerStack.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    containerStack.bottomAnchor.constraint(equalTo: hostView.bottomAnchor, constant: -13),
    containerStack.leadingAnchor.constraint(equalTo: hostView.leadingAnchor, constant: 10),
    containerStack.trailingAnchor.constraint(equalTo: hostView.trailingAnchor, constant: -10),
    containerStack.heightAnchor.constraint(equalToConstant: 420)
    ])
//: [Next](@next)


