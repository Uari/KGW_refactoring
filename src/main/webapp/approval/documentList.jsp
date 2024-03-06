<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.util.BSPageBar" %>
<%@  page import="com.vo.ApprovalVO" %>
<%
    List<ApprovalVO>list=(List)request.getAttribute("list");
    int size=0;
    if(list!=null){
        size=list.size();
    }
    int numPerPage=5;
    int nowPage=0;
    if(request.getParameter("nowPage")!=null){
        nowPage=Integer.parseInt(request.getParameter("nowPage"));
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>전자결재  기안자문서함</title>
    <%@include file="/common/bootstrap_common.jsp" %>


    <script>
        function boardSearch(){
            location.href='/approval/docu';
        }



    </script>
</head>

<body class="hold-transition sidebar-mini sidebar-collapse">
<div class="wrapper">
    <%@include file="/include/KGW_bar.jsp"%>
    <div class="content-wrapper">
        <!-- 페이지 path start    -->
        <%--		<div class="card" >--%>
        <div class="box-header p-4" >
            <div class="d-flex align-items-center">
                <div class="d-flex align-items-center me-2">
                    <a class="text-muted fs-6" href="#">전자결재</a>
                    <div class="ms-2">></div>
                </div>
                <div class="d-flex align-items-center">
                    <div class="text-dark fs-6">문서함</div>
                </div>
            </div>
            <div class="d-flex align-items-center mt-2">
                <div class="position-relative">
                    <div class="position-absolute top-0 start-0" ></div>
                </div>
                <div class="d-flex align-items-center ms-2">
                    <div class="fw-bold fs-5">문서함</div>
                    <div class="text-muted ms-3">결재문서 정보 조회할수 있는 페이지입니다.</div>
                </div>
            </div>
        </div>
        <!-- 페이지 path end -->

        <!-- Main content -->
        <section class="content">
            <!-- Info boxes -->
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="container">
                            <div class="box-header">
                                <h4 style="font-weight: bold; margin-left: 1.5rem" >기안자 문서함</h4>
                                <hr />
                            </div>

                            <!-- 검색기 시작 !! div 안에 있는 태그 건들지마시오!! -->
                            <div class="row">

                                <div class="col-3">
                                    <input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요"
                                           aria-label="검색어를 입력하세요." aria-describedby="btn_search" onkeyup="searchEnter()"/>
                                </div>
                                <div class="col-1 ">
                                    <button id="btn_search" class="btn btn-danger" onclick="boardSearch()">검색</button>

                                </div>
                                			<div class="col-md-6 d-flex justify-content-end gap-2">
                                				<button id="btn_search2" class="btn btn-danger" onclick="boardSearch()">기안서 작성 </button>
                                			</div>
                                <!-- 검색기 끝 -->

                                <!-- 회원목록 시작 -->
                                <div class='board-list'>
                                    <table class="table table-hover text-center ">
                                        <thead>
                                            <tr>
                                                <th width="10%" >문서ID</th>
                                                <th width="10%">종류</th>
                                                <th width="10%">제목</th>
                                                <th width="15%">결재상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                            for(int i =nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
                                                if(i==size)break;
                                                ApprovalVO approvalVO=(ApprovalVO) list.get(i);
                                            %>
                                            <tr>
                                            <td><%= approvalVO.getDocument_no()%></td>
                                            <td><%= approvalVO.getDocument_category()%></td>
                                             <td><%= approvalVO.getDocument_title()%></td>
                                             <td><%= approvalVO.getState()%></td>
                                            </tr>
                                            <%
                                                }
                                        %>
                                        </tbody>
                                    </table>
                                    <hr />

                                    <!-- [[ Bootstrap 페이징 처리  구간  ]] -->
                                    <ul class="pagination">
                                        <%
                                            String pagePath="documentList";
                                            BSPageBar bsbp=new BSPageBar(numPerPage,size,nowPage,pagePath);
                                            out.print(bsbp.getPageBar());
                                        %>
                                    </ul>
                                    <!-- [[ Bootstrap 페이징 처리  구간  ]] -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
</body>
</html>