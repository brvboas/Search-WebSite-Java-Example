// JavaScript Document

function validaCheckbox(){

    var frm = document.formPublication;
    //Percorre os elementos do formul�rio
    for(i=0; i < frm.length; i++){
		
		
        //Verifica se o elemento do formul�rio corresponde a um checkbox e se � o checkbox desejado
        if(frm.elements[i].type == "checkbox"  ){
            //Verifica se o checkbox foi selecionado
            if(frm.elements[i].checked){
                return true;
            }
        }
    }
    alert("Nenhum item foi selecionado!");
    return false;
}

function remover(){
    if ( validaCheckbox() && confirm('Quer mesmo remover os artigos selecionados?')){
        window.location = "myPublicationsPage.html";
    }
}

function remover2(p){
    if (confirm('Quer mesmo remover o artigo?')){
        window.location = "myPublicationsPage.jsp?id="+p+"&p=del";
        return true;
    }
    else
        return false;
}

function retornaPesquisa(p){
    window.location = "publicationsManagerPage.jsp?id=0&p=null&busca="+p;
}