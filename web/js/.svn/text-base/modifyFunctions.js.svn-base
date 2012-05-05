

//N�o altere esses valores!
var iCount = 0;
var iCampos = 1;
var hidden1; 


//Definindo quantos campos poder�o ser criados (m�ximo);
var iCamposTotal = 10; 



//Fun��o que adiciona os campos;
function addInput() {   
    if (iCampos <= iCamposTotal) {
        hidden1 = document.getElementById("hidden1");
 	
        //Criando uma vari�vel que armazenar� as informa��es da linha que ser� criada.
        //Os campos est�o sendo colocados no interior de uma div, pois a linha cont�m muitos elementos;
        //Basta excluir a div, para excluir todos os elementos da linha;
        var texto = "<div id='linha"+iCount+"'><input type='text' size='40' maxlength='60' name='autorArtigo"+iCount+"' id='autorArtigo"+iCount+"' > <a id='autor_remover' href='javascript:removeInput(\"linha"+iCount+"\")'> [-]Remover </a> </div>";
  
        //Capturando a div principal, na qual os novos divs ser�o inseridos:
        var camposTexto = document.getElementById('camposTexto');
        camposTexto.innerHTML = camposTexto.innerHTML+texto;
  
        //Escrevendo no hidden os ids que ser�o passados via POST;
        //No c�digo ASP ou PHP, voc� poder� pegar esses valores com um split, por exemplo;
        if (hidden1.value == "") {
            document.getElementById("hidden1").value = iCount;
        }else{
            document.getElementById("hidden1").value += ","+iCount;
        }
        iCount++;
        iCampos++;
    }
}
   
//Fun��o que remove os campos;
function removeInput(e) {
    var pai = document.getElementById('camposTexto');
    var filho = document.getElementById(e);
    hidden1 = document.getElementById("hidden1");
    var campoValor = document.getElementById("autorArtigo"+e.substring(5)).value;
    var lastNumber = hidden1.value.substring(hidden1.value.lastIndexOf(",")+1);

    if(confirm("O campo será excluído permanentemente!\n\nDeseja prosseguir?")){
        //Removendo o valor de hidden1:
        if (e.substring(5) == hidden1.value) {
            hidden1.value = hidden1.value.replace(e.substring(5),"");
        }else if(e.substring(5) == lastNumber) {
            hidden1.value = hidden1.value.replace(","+e.substring(5),"");
        }else{
            hidden1.value = hidden1.value.replace(e.substring(5)+",","");
        }
        iCampos--;
    }
}

function carregaAutores(){
	
    document.formSend.autorArtigo.value="Jugen Annevelink";
    var vetAutor=["Rafiul Ahad", "Amelia Carlson", "Daniel H. Fishman", "Michael L. Heytens", "Williaom Kent"];
    for (var i=0 ; i<5 ; i++){
        addAutor(vetAutor[i]);
    }
}

function addAutor(val) {   
    if (iCampos <= iCamposTotal) {
        hidden1 = document.getElementById("hidden1");
 	
        //Criando uma vari�vel que armazenar� as informa��es da linha que ser� criada.
        //Os campos est�o sendo colocados no interior de uma div, pois a linha cont�m muitos elementos;
        //Basta excluir a div, para excluir todos os elementos da linha;
        var texto = "<div id='linha"+iCount+"'><input type='text' size='40' maxlength='60' value='"+val+"' name='autorArtigo"+iCount+"' id='autorArtigo"+iCount+"' > <a id='autor_remover' href='javascript:removeInput(\"linha"+iCount+"\")'> [-]Remover </a> </div>";
  
        //Capturando a div principal, na qual os novos divs ser�o inseridos:
        var camposTexto = document.getElementById('camposTexto');
        camposTexto.innerHTML = camposTexto.innerHTML+texto;
  
        //Escrevendo no hidden os ids que ser�o passados via POST;
        //No c�digo ASP ou PHP, voc� poder� pegar esses valores com um split, por exemplo;
        if (hidden1.value == "") {
            document.getElementById("hidden1").value = iCount;
        }else{
            document.getElementById("hidden1").value += ","+iCount;
        }
        iCount++;
        iCampos++;
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
    document.location='sendSuccessPage.html';
}