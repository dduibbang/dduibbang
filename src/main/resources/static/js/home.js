function getMyAdr(){
    $.ajax({
        type : "GET",
        // url: ($("#contextPath").val() + "/getLikeList"),
        url: "/getMyAddress",
        success: function(data) {
            console.log(data);
            $("#adr").html(data);
        },
        error : function() {
            alert('getMyAdr error');

        }
    });


}