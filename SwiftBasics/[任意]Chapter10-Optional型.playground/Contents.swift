// 10.1 optionalのInt型を定義してprintしてください
var optionalInt: Int? = nil

print(optionalInt)

// 10.2 unwrappedNumberがnilの場合に初期値が10になるようにして、printしてください
var unwrappedNumber: Int? = nil
let optionalnumber = unwrappedNumber ?? 10
print(optionalnumber)

// 10.3 if let文を使って　アンラップしてprintしてください

if let unwrappedNumber = optionalInt{
    print(unwrappedNumber)
}

