var tabY= false;
var tabN= false;
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

function search(){

    var searchCnd;
    var searchWrd;
    var safe_yn;

    if(tabY){
        searchCnd = document.getElementById("searchYCnd").value;
        searchWrd = document.getElementById("searchYWrd").value;
        safe_yn = document.getElementById("safe_y").value;
    }else{
        searchCnd = document.getElementById("searchNCnd").value;
        searchWrd = document.getElementById("searchNWrd").value;
        safe_yn = document.getElementById("safe_n").value;
    }

    // if(searchWrd == "모집중" || "모집 중"){
    //     searchWrd = "01";
    // }else if(searchWrd== "모집완료" || "모집 완료"){
    //     searchWrd = "02";
    // }

    var dataForm = {safe_yn:safe_yn,"searchCnd" : searchCnd, searchWrd:searchWrd}
    //console.log(dataForm );

    $.ajax({
        async:true,
        type: "GET",
        url:"getSearchList",
        data:dataForm, // 필요한 파라미터 전달!
        contentType : 'application/json; charset=UTF-8',
        success: function (res){



            var riri = new Object();
            riri = res;
            console.log(riri);

            if(tabY){
                $("#brdY").empty();
            }else{
                $("#brdN").empty();
            }

            res.searchList.forEach(function (item,index){

                var tempHtml='';


                tempHtml+=
                '<div style="width: 1650px;cursor:pointer;" onClick="location.href=\'/board/" + item.brd_sn + "\'">'+
                    '<div class="mainCnt" style="background: #fef1c6;border-bottom: 20px solid #f9fcf3;">'+
                        '<div style="display: grid;padding: 30px;padding-bottom: 20px;grid-template-columns: 300px 1fr;">'+
                            '<div id="img_div2" style="margin-right: 50px;margin-left: 10px;">'+
                                '<img  id = "strImg" src='+ res.searchListStr[index].str_img +'onError="this.src=\'https://post-phinf.pstatic.net/MjAyMDA0MjlfNjIg/MDAxNTg4MTQxNjU3NzQz.ZDWTjIfuekjZLxo3CHMoKl6D5yyhJaeiMo0Cb_x_JRcg.Pj0UivY3zH6VL1Z_tg9brZxQ78_kwJez5KH_IBt3gdAg.PNG/%EC%9D%8C%EC%8B%9D_%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8_%EB%8F%84%EB%84%9B_%EA%B7%B8%EB%A6%BC%EA%B7%B8%EB%A6%AC%EA%B8%B0.png?type=w1200\';"/></div>'+
                           ' <div style="display: grid; grid-template-rows: 0.2fr 0.1fr 1fr 0.1fr;">'+

                                '<div style="display: flex;justify-content: space-between;align-items: stretch;">'+
                                    '<div style="display: flex;justify-content: space-between;align-items: baseline;">'+
                                        '<h3 style="font-weight:bold;margin-top: 0px;margin-bottom: 30px;">' + item.brd_ttl + '</h3>'+
                                            '<div class="basicBtn" style="background: #b5e2ef">' +res.searchListBrdSt[index] + '</div>'+
                                        '<div class="basicBtn" style="background: #b5e2ef">' + item.brd_ctgr + '</div>'+
                                        '<div class="basicBtn" style="background: #b5e2ef">'+ res.searchListStr[index].str_nm +'</div>'+
                                    '</div>'+
                                    '<h3 class="basicBtn" style="margin-top: inherit;">' + item.brd_pri + '</h3>'+
                                '</div>'+

                                '<div style="margin-top: 10px;margin-bottom: 10px;">' + item.rgtr_id + '</div>'+
                                '<div style="padding: 20px;background: #f9fcf3;margin: 10px;margin-left: 0px;margin-right: 0px">' + item.brd_cn + '</div>'+

                               ' <div style="display: flex;justify-content: space-between;align-items: baseline;">'+
                                   ' <div class="basicBtn" style="background: #b5e2ef">' + item.brd_adr + '</div>'+
                                    '<div style="display: flex;align-items: baseline;">'+
                                        '<div class="basicBtn" style="font-size: 20px;">' + item.brd_end_dt + '</div>'+
                                        '<div class="basicBtn" style="font-size: 20px;">' + item.brd_nn + '</div>'+
                                    '</div>'+
                                '</div>'+

                            '</div>'+
                        '</div>'+
                    '</div>'+
                '</div>'


                if(tabY){
                    $("#brdY").append(tempHtml);
                }else{
                    $("#brdN").append(tempHtml);
                }
            });


        },
        error: function(){
            alert("검색 결과물이 없습니다.")
        }
    })

}

function emptyYTab(){
    tabN = true;
    tabY = false;
}
function emptyNTab(){
    tabN = false;
    tabY = true;
}
