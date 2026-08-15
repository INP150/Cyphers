#import "maps.typ": diacriticsMap

// Variables
#let ALPHABET = "abcdefghijklmnopqrstuvwxyz"
#let LETTERS_IN_ALPHABET = ALPHABET.len()
#let ASCII_A = "a".to-unicode()
#let ASCII_0 = "0".to-unicode()
#let BIT_LEN = 8
#let FAILED_BRAILE = (1, 1, 1, 1, 1, 1)

// Functions

#let mod(val: int, mod: int) = calc.rem(val, mod)

#let pow(val: int, pow: int) = {
  let out = 1

  for i in range(0, pow) {
    out *= val
  }

  out
}

#let rng(i: int) = {
  mod(val: (i * 9301 + 49297), mod: 233280)
}


#let remove_diacritics(word: str) = {
  word.clusters().map(c => diacriticsMap.at(c, default: c)).join("")
}

#let simpleTranslation(word: str, separator: str, table: dictionary) = {
  word.clusters().map(c => table.at(c, default: c)).filter(x => x != "").join(separator)
}

#let return_nth_bit(val: int, n: int) = {
  (int)(mod(val: val, mod: pow(val: 2, pow: BIT_LEN - n)) / pow(val: 2, pow: n))
}

#let toBinary(val: int) = {
  let out = ()

  for i in range(8) {
    let bit = return_nth_bit(val: val, n: i)
    let ascii_val = mod(val: bit + ASCII_0, mod: 2)
    out.insert(0, (str)(ascii_val))
  }

  out.join(" ")
}
