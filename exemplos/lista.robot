
***Variables***
@{Nomes}         Fernando       Maria       João


***Test Cases***
Testando uma Lista
    :FOR         ${nome}       IN      @{Nomes} 

    \       Log To Console       ${nome} 

