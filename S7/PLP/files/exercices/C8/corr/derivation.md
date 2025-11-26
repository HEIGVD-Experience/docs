
<expr> = <term> { '||' <term> }
<term> = <bool> { '&&' <bool> }
<bool> = 'True' |  'False'

do the drivation steps for the expression: True && False || True

<expr>
    => <term> { '||' <term> }
    => <term> '||' <term>
    => <bool> { '&&' <bool> } '||' <term>
    => <bool> '&&' <bool> '||' <term>
    => 'True' '&&' <bool> '||' <term>
    => 'True' '&&' 'False' '||' <term>
    => 'True' '&&' 'False' '||' <bool> { '&&' <bool> }
    => 'True' '&&' 'False' '||' <bool>
    => 'True' '&&' 'False' '||' 'True'


<expr>
<term>
<bool>
True
True && <bool>
True && False
True && False || <term>
True && False || <bool>
True && False || True