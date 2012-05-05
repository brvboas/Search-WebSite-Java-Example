// JavaScript Document

function valida() {

    if (document.cadastro.nome.value !="")
    {
        if (document.cadastro.nome.value.length < 4)
        {
            alert("Por Favor preencha Seu nome Completo.");
            document.cadastro.nome.focus();
            return false;
        }
    }
    else
    {
        alert("Por Favor preencha seu nome.");
        document.cadastro.nome.focus();
        return false;
    }
				
    if (document.cadastro.email1.value !="")
    {
        email=document.cadastro.email1.value;
        if (email.indexOf("@",0) == -1)
        {
            alert("Por Favor preencha Seu E-mail Completo.");
            document.cadastro.email1.focus();
            return false;
        }
    }
    else
    {
        alert("Por Favor preencha seu Email.");
        document.cadastro.email1.focus();
        return false;
    }

    if ((document.cadastro.sexo[0].checked == false) && (document.cadastro.sexo[1].checked == false))
    {
        alert("Selecione o sexo!");
        document.cadastro.sexo[0].focus();
        return false;
    }
				
    if (document.cadastro.dia_nasc.value == -1)
    {
        alert("Por Favor preencha o dia do seu nascimento.");
        document.cadastro.dia_nasc.focus();
        return false;
    }
    if (document.cadastro.mes_nasc.value == -1)
    {
        alert("Por Favor preencha o mês do seu nascimento.");
        document.cadastro.mes_nasc.focus();
        return false;
    }
    if(document.cadastro.dia_nasc.value > 29 && document.cadastro.mes_nasc.value == 2 && document.cadastro.ano_nasc.value%4 ==0){
        alert("Por Favor preencha um dia válido do seu nascimento.");
        document.cadastro.dia_nasc.focus();
        return false;
    }
    if(document.cadastro.dia_nasc.value > 28 && document.cadastro.mes_nasc.value == 2 && document.cadastro.ano_nasc.value%4 !=0){
        alert("Por Favor preencha um dia válido do seu nascimento.");
        document.cadastro.dia_nasc.focus();
        return false;
    }
    if (document.cadastro.ano_nasc.value == -1)
    {
        alert("Por Favor preencha o ano do seu nascimento.");
        document.cadastro.ano_nasc.focus();
        return false;
    }
				
    if (document.cadastro.pais.value == -1)
    {
        alert("Preencha Seu País!");
        document.cadastro.pais.focus();
        return false;
    }

    if (document.cadastro.cidade.value=="")
    {
        alert("Preencha sua cidade !");
        document.cadastro.cidade.focus();
        return false;
    }

    if ((document.cadastro.escolaridade[0].checked == false) &&(document.cadastro.escolaridade[1].checked == false) && (document.cadastro.escolaridade[2].checked == false) && (document.cadastro.escolaridade[3].checked == false) && (document.cadastro.escolaridade[4].checked == false) && (document.cadastro.escolaridade[5].checked == false) && (document.cadastro.escolaridade[6].checked == false) && (document.cadastro.escolaridade[7].checked == false))
    {
        alert("Selecione seu grau de Escolaridade!");
        document.cadastro.escolaridade[0].focus();
        return false;
    }
    if (document.cadastro.username.value =="")
    {
        alert("O Campo Login não está preenchido !");
        document.cadastro.username.focus();
        return false;
    }
    if (document.cadastro.password.value !="")
    {
        if (document.cadastro.password.value.length < 8)
        {
            alert("A sua senha necessita de 8 digitos, no mínimo !");
            document.cadastro.password.focus();
            return false;
        }
    }
    else
    {
        alert("Crie uma Senha !");
        document.cadastro.password.focus();
        return false;
    }
    if (document.cadastro.confpassword.value !="")
    {
        if (document.cadastro.confpassword.value.length < 8)
        {
            alert("A sua senha necessita de 8 digitos, no mínimo !");
            document.cadastro.confpassword.focus();
            return false;
        }
    }
    else
    {
        alert("Insira a Confirmação da sua senha !");
        document.cadastro.confpassword.focus();
        return false;
    }
                
    if (document.cadastro.password.value != document.cadastro.confpassword.value) {
        alert ("A confirmição da sua senha está incorreta, digite novamente!");
        return false;
    }

  
	
    document.getElementById("cadastro").submit();
    //document.location='registerSuccessPage.html';
    return true;
}

// -->
