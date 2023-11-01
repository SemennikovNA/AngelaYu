
func loveCalculate() {
    let randomNumber = Int.random(in: 1...100)
    
    switch randomNumber {
    case 0...39:
        print("You'll be forever alone")
    case 40...79:
        print("You go together like Coke and Mentos")
    case 80...100:
        print("You love each other like Kanye loves Kanye")
    default:
        print("Error")
    }
}

loveCalculate()
