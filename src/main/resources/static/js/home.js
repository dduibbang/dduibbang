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
function searchY(){
    var searchYCnd = document.getElementById("searchYCnd").value;
    var searchYWrd = document.getElementById("searchYWrd").value;

    if(searchYWrd == "모집중" || "모집 중"){
        searchYWrd = '01';
    }else if(searchYWrd== "모집완료" || "모집 완료"){
        searchYWrd = '02';
    }

    var dataForm = {"searchYCnd" : searchYCnd, "searchYWrd":searchYWrd};

    $.ajax({
        async:true,
        type: "GET",
        url:"/getSearchYList",
        data:dataForm,
        dataType:"json",
        success: function (res){
            $("#brd").empty();

            var tempHtml="gg";
            // res.searchList.forEach(function (item,index){
            //     tempHtml+=
            //
            // });

            $("#brd").append(tempHtml);
        },
        error: function(){
            alert("통신 실패.")
        }
    })

}