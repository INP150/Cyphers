#import "/Helpers/common.typ": ALPHABET, ASCII_A, remove_diacritics, toBinary

#let binaryCypher(word: str) = {
  set text(13pt)

  let out = ()
  let normalizedWord = remove_diacritics(word: word)

  for c in normalizedWord.clusters() {
    let lc = lower(c)
    if lc not in ALPHABET {
      continue
    }

    let num = str.to-unicode(lc) - ASCII_A
    let binary = toBinary(val: num)
    out.insert(0, binary)
  }

  out.join("\n")
}
