#import "/Helpers/common.typ": ALPHABET

#let reverseCypher(word: str) = {
  let out = ()

  for c in word.clusters() {
    let lc = lower(c)
    if lc not in ALPHABET {
      continue
    }

    let uc = upper(c)
    out.insert(0, uc)
  }

  out.join("")
}
