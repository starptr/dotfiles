import string

TEMPLATE = r'- { key: X,      mods: Command,            chars: "\x1bx"            }'

if __name__ == '__main__':
    alphabet_lambda = lambda alpha: fr'- {{ key: {alpha.upper()},      mods: Command,            chars: "\x1b{alpha.lower()}"            }}'

    letters = list(string.ascii_lowercase)
    remaps = "\n".join(list(map(alphabet_lambda, letters)))
    print(remaps)
