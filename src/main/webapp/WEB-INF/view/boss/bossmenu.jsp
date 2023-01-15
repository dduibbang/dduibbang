<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>메뉴</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="../css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

</head>
<body class="sb-nav-fixed">

    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="boss">nBBang</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <div class="input-group">
                <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
            </div>
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#!">Settings</a></li>
                    <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                    <li><hr class="dropdown-divider" /></li>
                    <li><a class="dropdown-item" href="/bosslogout">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</body>

<body id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">Core</div>
                    <a class="nav-link" href="../boss">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Home
                    </a>
                    <div class="sb-sidenav-menu-heading">관리</div>
                    <a class="nav-link" href="../store">
                        <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                        매장 관리
                    </a>
                    <a class="nav-link" href="">
                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                        주문 관리
                    </a>
                </div>
            </div>
            <div class="sb-sidenav-footer">
                <div class="small">Logged in as:</div>
                어드민을 수정할 예정
            </div>
        </nav>
    </div>
</body>
    <body>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4"> <br>메뉴현황 </h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">Tables</li>
                    </ol>
                    <div class="card mb-4">
                        <div class="card-body">
                            현재 등록된 메뉴의 현황입니다

                        </div>
                    </div>


                    <section class="section area">
                        <div class="row">
                            <div class="col-lg-12">


                                <!-- General Form Elements -->

                                <div class="table-responsive">
                                    <div class="table-wrapper">
                                        <div class="table-title">
                                            <div class="row">
                                                <div class="col-xs-7">
                                                    <a href="" class="btn btn-primary btn-block mb-4"  onclick ="openCreate()"> <span>메뉴 등록</span></a>
                                                    <a href="../store" class="btn btn-primary btn-block mb-4"> <span>가게 목록</span></a>
                                                </div>
                                            </div>
                                        </div>
                                        <table class="table table-striped table-hover">
                                            <thead>
                                            <tr>

                                                <th style = "width : 12%">메뉴 카테고리</th>
                                                <th style = "width : 20%">메뉴 이름</th>
                                                <th style = "width : 50%">메뉴 설명</th>
                                                <th style = "width : 10%">메뉴 가격</th>
                                                <th style = "width : 3%">메뉴 옵션</th>
                                                <th style = "width : 5%">삭제</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${menu}" var="m">
                                                <tr>
                                                    <td>${m.menu_ctgr}</td>
                                                    <td>${m.menu_nm}</td>
                                                    <td>${m.menu_cn}</td>
                                                    <td>${m.menu_pr}</td>
                                                    <td>${m.menu_op}</td>
                                                    <td>
                                                        <button  style="top:680px" class = "btn btn-primary btn-block" onclick="location.href='menuDelete?${m.menu_sn}'">삭제</button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class="clearfix">
                                            <ul class="pagination justify-content-center">
                                                <li class="page-item disabled"><a href="#" class="page-link">Previous</a></li>
                                                <li class="page-item active"><a href="#" class="page-link">1</a></li>
                                                <li class="page-item "><a href="#" class="page-link">2</a></li>
                                                <li class="page-item "><a href="#" class="page-link">3</a></li>
                                                <li class="page-item "><a href="#" class="page-link">4</a></li>
                                                <li class="page-item "><a href="#" class="page-link">5</a></li>
                                                <li class="page-item "><a href="#" class="page-link">Next</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </main>
        </div>





        <script type="text/javascript">
            /*let openWin;*/
            var openWin;

            function openCreate() {
                // window.name = "부모창 이름";
                window.name = "storeForm";

                // window.open("open할 window", "자식창 이름", "팝업창 옵션");
                openWin = window.open("${str_sn}/regMenu", "createForm", "width=570, height=350, resizable = no, scrollbars = no");
            }
        </script>

    </body>




<footer class="py-4 bg-light mt-auto">
    <div class="container-fluid px-4">
        <div class="d-flex align-items-center justify-content-between small">
            <div class="text-muted">Copyright &copy; NBBANG 2023</div>

            </div>
        </div>
    </div>
</footer>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>

</html>
