/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function valida() {
    if (document.formLogin.login.value == ""){
        alert("Por Favor imforme seu login.");
        document.formLogin.login.focus();
        return false;
    }
    if (document.formLogin.senha.value == ""){
        alert("Por Favor imforme sua senha.");
        document.formLogin.senha.focus();
        return false;
    }
    document.getElementById("formLogin").submit();
    return true;
}

