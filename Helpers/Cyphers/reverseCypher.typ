#import "/Helpers/common.typ": ALPHABET, remove_diacritics

#let reverseCypher(word: str) = {
  set text(13pt)
  let cleanedWord = lower(remove_diacritics(word: word))
  cleanedWord.rev().clusters().filter(c => c in ALPHABET).join("")
}
