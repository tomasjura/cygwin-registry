define(`REG_EXPAND',`hex(2):esyscmd(printf "%s\0" "$1" | iconv -f UTF-8 -t UTF-16LE | od -A none -t x1 | sed -f reg_expand.sed)')dnl
