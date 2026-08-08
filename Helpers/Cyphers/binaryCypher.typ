#import "/Helpers/common.typ": ALPHABET, ASCII_A, toBinary

#let binaryCypher(word: str) = {
  let out = ()

  for c in word.clusters() {
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
