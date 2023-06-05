# ("", r' . d' . r . d' . f . d . f'), 
# ("", l . d . l' . d . f' . d' . f),
# ("", f . d . f' . d . r' . d' . r),
# ("", f' . d' . f . d' . l . d . l'),
# ("", r . d . r' . d . b . d' . b'),
# ("", l' . d' . l . d' . b' . d . b),
# ("", b . d' . b' . d' . r . d . r'), 
# ("", b' . d . b . d . l' . d' . l)

list = [
"l . d' . l . d . l . d . l . d' . l' . d' . l' . l'",
]


for string in list:
    string = string.split()
    string.reverse()
    string = " ".join(string)
    string_2 = string.replace(". ", "")

    print(f"(\"{string_2}\", {string}),")