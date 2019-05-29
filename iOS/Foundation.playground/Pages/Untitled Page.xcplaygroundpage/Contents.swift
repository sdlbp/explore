import UIKit

var str = "Hello, playground"
var result: String.Index?
print(str.index(after: str.startIndex))
print(str.index(before: str.endIndex))
result = str.index(str.startIndex, offsetBy: 2)
result = str.index(str.startIndex, offsetBy: 2, limitedBy: str.endIndex)

let a = "01234"


if let number = a.
index(of: "1") {
    print(number) // 1
    print(a[number...]) // 1234
}

if let number = a.index(where: { $0 > "1" }) {
    print(number) // 2
}
