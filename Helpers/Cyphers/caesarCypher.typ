#import "/Helpers/common.typ": ALPHABET, ASCII_A, LETTERS_IN_ALPHABET, normalize

#let caesarCypher(word: str, shift: int) = {
  set text(13pt)
  let out = ()
  let normalizedWord = normalize(word: word)

  for c in normalizedWord.clusters() {
    let lc = lower(c)

    if lc not in ALPHABET {
      continue
    }

    let shiftedChar = lc.to-unicode() + shift - ASCII_A

    while shiftedChar < 0 or shiftedChar >= LETTERS_IN_ALPHABET {
      if shiftedChar < 0 {
        shiftedChar += LETTERS_IN_ALPHABET
      } else if shiftedChar >= LETTERS_IN_ALPHABET {
        shiftedChar -= LETTERS_IN_ALPHABET
      }
    }

    let ascii = str.from-unicode(shiftedChar + ASCII_A)
    out.push(ascii)
  }

  out.join("")
}
