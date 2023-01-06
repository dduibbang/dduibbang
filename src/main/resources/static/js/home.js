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
            console.log('getMyAdr error');
            $("#adr").html("주소를 설정해주세요.");
        }
    });
}
