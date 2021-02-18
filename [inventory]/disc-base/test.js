address = "255.100.50.0"
length = 0
answer = ""

while (length <= address.length) {
    address.charAt(length) == "." ? answer += "[.]" : answer += address.charAt(length)
    length++
}
console.log(answer)