function formulariosLanding(form){
    var dataString;
    var url;
    dataString = $(form).serialize();
    if($(form).attr("id") == "formLogin"){
        url = "validarLogin";
    }
    $.post(url, dataString, function(respuesta, estado, jqXHR){
        if(estado == 200){
        	location.replace("../html/home.html")
        }
        else{
        	alert("Lo siento");
        }
    });
    console.log(url, dataString);
    alert($(form).attr("id"));
};