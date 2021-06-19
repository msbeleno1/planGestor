$(document).ready(function(){
	
	$("#lblNombreSession").html(localStorage.getItem("nombre"));
    $("#lblRolSession").html(localStorage.getItem("rol"));
    console.log(localStorage.getItem("nombre"));
    console.log(localStorage.getItem("rol"));
    localStorage.removeItem("nombre");
    localStorage.removeItem("rol");
	
    $(".btn-sub").click(function(e){
        let id = this.id;
        let indice;
        if($(".main-menu").css("overflow") === "hidden"){
            $(".main-menu").css("overflow","visible");
            $(".main-menu").css("width","250px");
        }
        $(".btn-sub").each(function(i){
            if(this.id == id){
                indice = i;
            }
        });
        $(".sub").each(function(j){
            if(j == indice){
                hideSub();
                $(this).toggleClass('d-none');
            }
        });     
    });

    $("#btn-menu").click(function(e){
        if($(".contenedor-main-menu").css("position") === "absolute"){
            if($(".main-menu").css("overflow") === "visible"){
                hideSub();
                $(".main-menu").css("overflow","hidden");
                $(".main-menu").css("display","none");
            }
            else{
                $(".main-menu").css("overflow","visible");
                $(".main-menu").css("display","block");
            }
        }
        else{
            if($(".main-menu").css("overflow") === "visible"){
                hideSub();
                $(".main-menu").css("overflow","hidden");
                $(".main-menu").css("width","60px");
            }
            else{
                $(".main-menu").css("overflow","visible");
                $(".main-menu").css("width","250px");
            }
        }
    });

    $(".btn-menu").click(function(e){
        hideSub();
        if($(".main-menu").css("overflow") === "hidden"){
            $(".main-menu").css("overflow","visible");
            $(".main-menu").css("width","250px");
        }
    });

    $(".main-menu").hover(function(){
        $("#img-brand").replaceWith('<img id="img-brand" src="../img/logo_iniciales.svg" width="70" height="30" class="my-0 mr-auto ml-auto" alt="planGestor-Logo-Iniciales">');
    }, function(){
        $("#img-brand").replaceWith('<img id="img-brand" src="../img/logo_iniciales.svg" width="70" height="30" class="my-0 mr-auto ml-auto" alt="planGestor-Logo-Iniciales">');
    });

    function hideSub(){
        $(".sub").each(function(){
            if($(this).hasClass('d-none') === false){
                $(this).addClass('d-none');
            }
        });
    }
});