
var iCount = 0;
var iCampos = 1;
var hidden1; 


//Definindo quantos campos poder�o ser criados (m�ximo);
var totalCampos = 10; 
var fields = 0; 


//Fun��o que adiciona os campos;
function addInput() {   
    var hidden1 = document.getElementById("hidden1");
    var hidden2 = document.getElementById("hidden2");
    var hidden3 = document.getElementById("hidden3");

    //Executar apenas se houver possibilidade de inser��o de novos campos:
    if (iCount < totalCampos) {

        //Limpar hidden1, para atualizar a lista dos campos que ainda est�o vazios:
        hidden2.value = "";

        //Atualizando a lista dos campos que est�o ocultos.
        for (iLoop = 1; iLoop <= totalCampos; iLoop++) {
    
            if (document.getElementById("linha"+iLoop).style.display == "none") {
                if (hidden2.value == "") {
                    hidden2.value = "linha"+iLoop;
                        
                }else{
                    hidden2.value += ",linha"+iLoop;
                      
                }
            }
        }
        //Quebrando a lista que foi armazenada em hidden2 em array:

        linhasOcultas = hidden2.value.split(",");


        if (linhasOcultas.length > 0) {
            //Tornar vis�vel o primeiro elemento de linhasOcultas:
            document.getElementById(linhasOcultas[0]).style.display = "block"; iCount++;
                
            //Acrescentando o �ndice zero a hidden1:
            if (hidden1.value == "") {
                hidden1.value = linhasOcultas[0];
                hidden3.value = iCount;
            }else{
                hidden1.value += ","+linhasOcultas[0];
                hidden3.value = iCount;
            }
                

        }
    }
}
   
//Fun��o que remove os campos;
function RemoverCampos(id) {
    //Criando ponteiro para hidden1:
    var hidden1 = document.getElementById("hidden1");
    var hidden3 = document.getElementById("hidden3");

    //Pegar o valor do campo que ser� exclu�do:
    var campoValor = document.getElementById("arq"+id).value;
    //Se o campo n�o tiver nenhum valor, atribuir a string: vazio:
    if (campoValor == "") {
        campoValor = "vazio";
    }

    if(confirm("O campo será excluído!\n\nDeseja prosseguir?")){
        document.getElementById("linha"+id).style.display = "none"; iCount--;
                
        //Removendo o valor de hidden1:
        if (hidden1.value.indexOf(",linha"+id) != -1) {
            hidden1.value = hidden1.value.replace(",linha"+id,"");
        }else if (hidden1.value.indexOf("linha"+id+",") == 0) {
            hidden1.value = hidden1.value.replace("linha"+id+",","");
        }else{
            hidden1.value = "";
        }
        hidden3.value=iCount;

    }
}

function valida() {
    if (document.formSend.tituloArtigo.value =="")
    {
        
        alert("Por Favor preencha o título do artigo.");
        document.formSend.tituloArtigo.focus();
        return false;
    }
    if (document.formSend.autorArtigo.value =="")
    {
        
        alert("Por Favor preencha o autor do artigo.");
        document.formSend.autorArtigo.focus();
        return false;
    }
    if (document.formSend.localArtigo.value =="")
    {
        
        alert("Por Favor preencha o local de publicação do artigo.");
        document.formSend.localArtigo.focus();
        return false;
    }
	
	 
	
    if (document.formSend.paginaDeArtigo.value =="")
    {
        
        alert("Por Favor preencha a página de início do artigo.");
        document.formSend.paginaDeArtigo.focus();
        return false;
    }
    if (document.formSend.paginaAteArtigo.value =="")
    {
        
        alert("Por Favor preencha a página final do artigo.");
        document.formSend.paginaAteArtigo.focus();
        return false;
    }
	
    //nao ta funfando para verificar se digitaram numeros apenas
    if (isNaN(document.formSend.paginaDeArtigo.value)){
        alert("Por Favor informe apenas numeros na página inicial do artigo.");
        document.formSend.paginaDeArtigo.focus();
        return false;
    }
    if (isNaN(document.formSend.paginaAteArtigo.value)){
        alert("Por Favor informe apenas numeros na página final do artigo.");
        document.formSend.paginaAteArtigo.focus();
        return false;
    }
    if (document.formSend.paginaDeArtigo.value > document.formSend.paginaAteArtigo.value){
        alert("A página final deve ser maior ou igual a inicial!");
        document.formSend.paginaDeArtigo.focus();
        return false;
    }
	
	
	
    if (document.formSend.anoArtigo.value !="")
    {
        if (document.formSend.anoArtigo.value.length < 4){
            alert("Por Favor preencha o ano corretamente, (aaaa).");
            document.formSend.anoArtigo.focus();
            return false;
        }
    }
    else {
        
        alert("Por Favor preencha o ano do artigo.");
        document.formSend.anoArtigo.focus();
        return false;
    }
	
    document.getElementById("formSend").submit();
	
}