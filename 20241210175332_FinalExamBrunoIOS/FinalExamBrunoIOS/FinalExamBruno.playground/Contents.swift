import Foundation


func happyNum(_ number: Int) -> Bool{
  var num = number

  while (num != 1 && num != 4){
    num = sumOfSq(num)
  }
  return num == 1
}

func sumOfSq(_ number: Int) -> Int{
  var sum = 0
  var current = number

  while current > 0{
    let d = current % 10
    sum += (d * d)
    current /= 10
  }
  return sum
}

func isHappyNumber(_ number: Int) {
    if happyNum(number) {
        print("\(number) is a happy number!")
    } else {
        print("\(number) is not a happy number.")
    }
}

isHappyNumber(19)


func perfectNumber(_ number: Int){
    
    if number < 2 {
        print("false")
    }
    var sum = 1
    for i in 2...(number / 2) // include all numbers in the range of 1 to (number / 2)
    {
        if number % i == 0 {
            sum += i
        }
    }
    if (sum == number){
      print("true")
    }else {
      print("false")
    }
  }

perfectNumber(28)
perfectNumber(12)
