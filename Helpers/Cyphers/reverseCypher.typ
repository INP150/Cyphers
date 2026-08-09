#import "/Helpers/common.typ": ALPHABET, normalize

#let reverseCypher(word: str) = {
  set text(13pt)
  lower(normalize(word: word)).rev().split("").filter(c => c in ALPHABET).join("")
}
