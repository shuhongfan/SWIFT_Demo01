func count(string : String) -> (vowels : Int, consonants : Int, others: Int) {
    var vowels = 0, consonants = 0, others = 0
    for character in string.characters{
        switch String(character).lowercased() {
        case "a", "e", "i", "o", "u":  // 元音
            vowels = vowels + 1
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n",
        "p", "q", "r", "s", "t", "v", "w", "x", "y", "z": // 辅音
            consonants = consonants + 1
        default:
            others = others + 1
        }
    }
    return (vowels, consonants, others)
}
let total = count(string: "welcome to itcast")
print("\(total.vowels) 个元音字母和 \(total.consonants) 个辅音字母")

