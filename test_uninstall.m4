`UNINSTALL' : ifdef(`UNINSTALL',YES,NO)
`UNINSTALL_ASSOCIATION' : ifdef(`UNINSTALL_ASSOCIATION',YES,NO)

def_key(MY_BASE,a\crazy\path)
BASE IS: MY_BASE
second base
def_key(SECOND_BASE,c\crazy\path)

`association to default value'
association(MY_BASE,@,setup,uninstall)

`association to specific value my_val'
association(MY_BASE,my_val,setup)


---- uninstall section ------
