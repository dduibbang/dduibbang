var HOME_PATH = window.HOME_PATH || '.';
var map;
var crd,lati,longi;
var infoWindow;
var SearchMarkerList=[];
var menuLayer = $('<div style="position:absolute;z-index:10000;background-color:#fff;border:solid 1px #333;padding:10px;display:none;"></div>');
var address;

$(document).ready(function(){

    // 코드수정 반영 디버깅용
    //alert(crd.latitude+","+crd.longitude);

    getMyData();

    $("#nowLo").click(function (){
        map.setCenter(new naver.maps.LatLng(lati, longi));
        map.setZoom(12);
    });

});
function getMyData(){
    $.ajax({
        type : "GET",
        // url: ($("#contextPath").val() + "/getLikeList"),
        url: "/getLikeList",
        dataType:"json",
        success: function(data) {
            console.log(data);
            setData(data);
        },
        error : function() {
            alert('error');
        }
    });


}

// function myFunction() {
//     getData($("#searchInput").val());
// }

function setMyMap() {

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new naver.maps.LatLng(lati, longi), // 지도의 중심좌표
            zoom: 16, // 지도의 확대 레벨
            mapTypeControl: true,

        };

    // 지도를 생성합니다
    map = new naver.maps.Map(mapContainer, mapOption);

    // 내 위치에 마커 띄우기
    var marker = new naver.maps.Marker({
        position: new naver.maps.LatLng(lati, longi),
        map: map,
        icon:{
            content: '<div class=infoWin>'+'<img src="/img/me.png"   width="55" height="55" onerror="this.style.display=\'none\'" />'+'</div>',
        }
        // icon:{
        //     content:['<div class=infoWin>' +
        //     '<div style ="font-size:34px;">⬇</div>'+
        //     '</div>'
        //
        //     ].join('')
        // }
    });
    // 현재위치 인포창
    infoWindow = new naver.maps.InfoWindow({
        anchorSkew: true
    });

    // 현재위치의 주소얻기
    naver.maps.Event.addListener(marker, "click", function(e) {
        // $("#sub").css("background-color", "yellow");
        searchMyCoordToAddress(e.coord);
    });


    map.setCursor('pointer');
    map.getPanes().floatPane.appendChild(menuLayer[0]);

    // 마우스 클릭이벤트
    map.addListener('click', function(e) {
        searchCoordinateToAddress(e.coord);
        // setMarkerAndInfo(e);
    });

    naver.maps.Event.addListener(map, 'mousedown', function(e) {
        menuLayer.hide();
    });
}
function setData(MyList){

    MyList.forEach(function (item){
        let itLocation = new naver.maps.LatLng(item.adr_lat,item.adr_lon);
        var marker = new naver.maps.Marker({
            map: map,
            position: itLocation,
            icon:{
                content:[
                    '<div class=infoWin style="background-color:#F8941D;font-family: \'TmoneyRoundWindExtraBold\';">' +
                    '<div style ="font-weight: bold;font-size:18px">'+item.adr_ttl+'</div>'+ // 제목
                    '</div>'

                ].join('')
            }
        });

        // 게시글 네비바에 띄우기
        naver.maps.Event.addListener(marker, "click", function(e) {

            infoWindow.close();
            // $("#sub").css("background-color", "yellow");

            $("#latiVal_").val(item.adr_lat);
            $("#longiVal_").val(item.adr_lon);
            $("#adr_cn_open").val(item.adr_cn);
            $("#adr_st_open").html(item.adr_st);
        });
    });
}
function searchMyCoordToAddress(latlng) {

    naver.maps.Service.reverseGeocode({
        coords: latlng,
        orders: [
            naver.maps.Service.OrderType.ADDR,
            naver.maps.Service.OrderType.ROAD_ADDR
        ].join(',')
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return alert('Something Wrong!');
        }

        var items = response.v2.results,

            htmlAddresses = [];

        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
            item = items[i];
            address = makeAddress(item) || '';
            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';

            htmlAddresses.push(addrType +' '+ address);
        }

        $("#adr_cn_open").val(address);
        $("#adr_cn_close").val(address);
        $("#latiVal_").val(lati);
        $("#longiVal_").val(longi);
    });
}
function searchCoordinateToAddress(latlng) {

    infoWindow.close();

    naver.maps.Service.reverseGeocode({
        coords: latlng,
        orders: [
            naver.maps.Service.OrderType.ADDR,
            naver.maps.Service.OrderType.ROAD_ADDR
        ].join(',')
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return alert('Something Wrong!');
        }

        var items = response.v2.results,

            htmlAddresses = [];

        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
            item = items[i];
            address = makeAddress(item) || '';
            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';

            htmlAddresses.push(addrType +' '+ address);
        }

        infoWindow.setContent([
            '<div class=infoWin style="background-color:#F8941D; border-radius: 10px" >',
            htmlAddresses.join('<br />'),
            '</div>'
        ].join('\n'));
        infoWindow.open(map, latlng);

        $("#adr_cn_open").val(address);
        $("#adr_cn_close").val(address);

        getData(address);
    });
}

function getData(target){
    $.ajax({
        method: "GET",
        url: "https://dapi.kakao.com/v2/local/search/keyword.json?y=" + lati.toString() + "&x=" + longi.toString(),
        //url: "https://dapi.kakao.com/v2/local/search/keyword.json",
        data: {query: target},
        headers: {Authorization: "KakaoAK 00b285e6c72f581d9c2f16bb7c585100"}
    })
        .done(function (msg) {
            for (var i=0, ii=SearchMarkerList.length; i<ii; i++) {
                SearchMarkerList[i].setMap(null);
            }
            SearchMarkerList = [];

            console.log(msg);
            try {

                msg.documents.forEach(function (item){
                    var marker = new naver.maps.Marker({
                        map: map,
                        position: new naver.maps.LatLng(item.y, item.x), // la : y / lng : x
                    });

                    var infowindow = new naver.maps.InfoWindow({
                        anchorSkew: true
                    });

                    infowindow.setContent([
                        '<div class=infoWin style="background-color: #F8941D">' +
                        '<div style ="font-weight: bold;font-size:17px">'+item.place_name+'</div>'+
                        '</div>'

                    ].join(''));

                    naver.maps.Event.addListener(marker, "click", function(e) {

                        $("#latiVal_").val(item.y);
                        $("#longiVal_").val(item.x);
                        $("#latiVal").val(item.y);
                        $("#longiVal").val(item.x);
                        $("#adr_cn_open").val(item.address_name);
                        $("#adr_st_open").html(item.address_name);

                    });

                    naver.maps.Event.addListener(marker, 'mouseover', function(e) {
                        infoWindow.close();
                        infowindow.open(map, marker);
                    });

                    SearchMarkerList.push(marker);
                });

                $("#latiVal").val(msg.documents[0].y);
                $("#longiVal").val(msg.documents[0].x);
                $("#latiVal_").val(msg.documents[0].y);
                $("#longiVal_").val(msg.documents[0].x);

                // 화면 이동
                var moveLatLon = new naver.maps.LatLng(msg.documents[0].y, msg.documents[0].x);
                map.panTo(moveLatLon);

            } catch (error) {
                $("#adr_cn_open").val("정보가 없습니다.");
            }
        });
}
function makeAddress(item) {
    if (!item) {
        return;
    }

    var name = item.name,
        region = item.region,
        land = item.land,

        isRoadAddress = name === 'roadaddr';

    var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

    if (hasArea(region.area1)) {
        sido = region.area1.name;
    }

    if (hasArea(region.area2)) {
        sigugun = region.area2.name;
    }

    if (hasArea(region.area3)) {
        dongmyun = region.area3.name;
    }

    if (hasArea(region.area4)) {
        ri = region.area4.name;
    }

    if (land) {
        if (hasData(land.number1)) {
            if (hasData(land.type) && land.type === '2') {
                rest += '산';
            }

            rest += land.number1;

            if (hasData(land.number2)) {
                rest += ('-' + land.number2);
            }
        }

        if (isRoadAddress === true) {
            if (checkLastString(dongmyun, '면')) {
                ri = land.name;
            } else {
                dongmyun = land.name;
                ri = '';
            }

            if (hasAddition(land.addition0)) {
                rest += ' ' + land.addition0.value;
            }
        }
    }

    return [sido, sigugun, dongmyun, ri, rest].join(' ');
}

function hasArea(area) {
    return !!(area && area.name && area.name !== '');
}

function hasData(data) {
    return !!(data && data !== '');
}

function checkLastString (word, lastString) {
    return new RegExp(lastString + '$').test(word);
}

function hasAddition (addition) {
    return !!(addition && addition.value);
}

var options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0
};

function success(pos) {
    crd = pos.coords;
    lati = crd.latitude;
    longi = crd.longitude;

    setMyMap();
};

function error(err) {
    console.warn('ERROR(' + err.code + '): ' + err.message);
};


navigator.geolocation.getCurrentPosition(success, error, options);
