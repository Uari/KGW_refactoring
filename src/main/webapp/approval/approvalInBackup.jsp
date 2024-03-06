<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.vo.ApprovalVO"%>
<%@ page import="com.vo.EmpVO" %>

<%
    List<ApprovalVO> list = (List<ApprovalVO>)request.getAttribute("approvalDetail");
    ApprovalVO approvalVO = list.get(0);
//    out.print(approvalVO);
%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>결재 문서{영입}</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/signature_pad/1.5.3/signature_pad.min.js"></script>
    <link  rel="stylesheet " href="../css/approval.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
    const approvalSubmit = () =>{
        document.querySelector('#approvalForm').submit();
    }
  </script>

</head>
<body class="hold-transition sidebar-mini sidebar-collapse">
<div class="wrapper">
    <%@include file="/include/KGW_bar.jsp"%>
    <div class="content-wrapper">
        <div class="box-header p-4" >
            <div class="d-flex align-items-center">
                <div class="d-flex align-items-center me-2">
                    <a class="text-muted fs-6" href="#">전자결재</a>
                    <div class="ms-2">></div>
                </div>
                <div class="d-flex align-items-center">
                    <div class="text-dark fs-6">결재함</div>
                </div>

            </div>
            <div class="d-flex align-items-center mt-2">
                <div class="position-relative">
                    <div class="position-absolute top-0 start-0" ></div>
                </div>
                <div class="d-flex align-items-center ms-2">
                    <div class="fw-bold fs-5">결재문서 </div>
                    <div class="text-muted ms-3">문서를 결재할 수 있는 페이지입니다.</div>
                </div>
            </div>
        </div>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="container">
                            <div class="box-header">
                                <h4 style="font-weight: bold; margin-left: 1.5rem">결재문서</h4>
                                <hr />
                            </div>
                            <!-- Document Sections -->
                            <% if (approvalVO!=null){ %>
                                <div class="frame" id="frame_tool">
                                    <div class="document-section">
                                        <div class="item">
                                            <span class="title">부서:</span>
                                            <span class="value"><%=approvalVO.getTeam_name()%></span>
                                        </div>
                                        <div class="item">
                                            <span class="title">신청자:</span>
                                            <span class="value"><%=approvalVO.getName()%></span>
                                        </div>

                                        <div class="item">
                                            <span class="title">영입 희망선수:</span>
                                            <span class="value"><%=approvalVO.getK_name()%></span>
                                        </div>
                                        <div class="text-wrapper-2">상기와 같이 영입 희망함</div>
                                    </div>
                                    <div class="signature-section">   <%--  여기에 select 기안자  sessionVO.geti??? --%>
<%--                        코드 참조                 <div class="signImg" style="border: 2px solid grey; width: 200px; height: 200px">
                  <img id="signImage" src="/fileUpload/sign/<%=empDetail.getEmp_no()%>.png" style="width: 190px; height: 190px" class="sign" alt="sign" data-bs-toggle="modal" data-bs-target="#signSelect">
                </div>--%>
<%--                                        <img id="signImage" src="/fileUpload/sign/<%=empDetail.getEmp_no()%>.png" style="width: 190px; height: 190px" class="sign" alt="sign" data-bs-toggle="modal" data-bs-target="#signSelect">--%>
<%--                                        <div class="sign blank" id="blank_sign_1"><%=approvalVO.getApproval_name()%></div>--%>
                                    <div class="signImg" style="border: 2px solid grey; width: 100px; height: 100px">
                                      <img id="middleSignImage" src="/fileUpload/approvalSign/<%=approvalVO.getApproval_no()%>_middleSign.png" style="width: 100px; height: 100px;" class="sign" alt="팀장" data-bs-toggle="modal" data-bs-target="#middleSignSelect">
                                    </div>
                                    <div class="signImg" style="border: 2px solid grey; width: 100px; height: 100px">
                                      <img id="finalSignImage" src="/fileUpload/approvalSign/<%=approvalVO.getApproval_no()%>_finalSign.png" style="width: 100px; height: 100px; " class="sign" alt="구단장" data-bs-toggle="modal" data-bs-target="#finalSignSelect">
                                    </div>
                                    </div>
                                </div>
                                <% } %>
                            </div>
                            <form id="approvalForm" method="post" action="approvalUpdate">
                              <%
                                if (approvalVO.getApproval_category().equals("중간결재대기")){
                              %>
                                <input type="hidden" id="middlesign_name" name="middlesign_name" value="<%=approvalVO.getApproval_no()%>_middleSign.png">
                                <input type="hidden" id="approval_no" name="approval_no" value="<%=approvalVO.getApproval_no()%>">
                                <input type="hidden" id="approval_category" name="approval_category" value="<%=approvalVO.getApproval_category()%>">
                              <%
                                }else if (approvalVO.getApproval_category().equals("최종결재대기")){
                              %>
                                <input type="hidden" id="finalsign_name" name="finalsign_name" value="<%=approvalVO.getApproval_no()%>_finalSign.png">
                                <input type="hidden" id="approval_no" name="approval_no" value="<%=approvalVO.getApproval_no()%>">
                                <input type="hidden" id="approval_category" name="approval_category" value="<%=approvalVO.getApproval_category()%>">
                              <%
                                }
                              %>
                            </form>

                            <form id="approval_reject" method="post" action="approvalUpdate">
                                <%
                                    if (approvalVO.getApproval_category().equals("중간결재대기")){
                                        approvalVO.setApproval_category("중간결재반려");
                                    }else{
                                        approvalVO.setApproval_category("최종결재반려");
                                    }
                                %>
                                    <input type="hidden" id="rejection_content" name="rejection_content" value="">
                                    <input type="hidden" id="approval_" name="approval_no" value="<%=approvalVO.getApproval_no()%>">
                                    <input type="hidden" id="approval_category" name="approval_category" value="<%=approvalVO.getApproval_category()%>">
                            </form>
                            <input type="hidden" id="approvalCategory" name="approval_category" value="">
                            <div>
                                <div id="documentButton" class="col-md-6 d-flex justify-content-end gap-2">
                                    <button type="button" class="btn btn-danger" onclick="approvalSubmit()">승인</button>
                                    <button type="button" id="rejectButton" class="btn btn-danger"  onclick="approvalReject()">반려</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
            </div>

</div>


        <script>
            function approvalReject() {
                let  rejection_content = prompt("반려 사유를 입력하세요:", "여기에 사유를 입력");
                $('#rejection_content').val(rejection_content);
                $('#approval_reject').submit();
            }
        </script><%--반려 알럿창--%>
<script src="../build/js/as.js"></script>
<%
  if (approvalVO.getApproval_category().equals("중간결재대기")){
%>
<div class="modal" id="middleSignSelect">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content rounded-4 shadow">
      <div class="modal-header p-5 pb-0 border-bottom-0" style="margin-bottom: -20px;">
        <h1 class="fw-bold  fs-2" >전자서명변경</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body p-5 pt-0">
        <form id="middleSignInsert" method="post" action="/approvalSignSave" enctype="multipart/form-data">
          <canvas id="middleSign-pad" width=400 height=200 style="margin-bottom: 20px; border: 2px solid black"></canvas>
          <input type="hidden" id="emp_no1" name="emp_no" value="">
          <div>
            <button type="button" id="middleSignClear" class="btn btn-danger">초기화</button>
            <button type="button" id="middleSignSave" class="btn btn-danger">저장</button>
            <button type="button" class="btn btn-danger button save" data-action="middleSignSave-png">내 pc에 저장</button>
          </div>
          <script>
              let canvas = document.getElementById('middleSign-pad');
              let signaturePad = new SignaturePad(canvas);


              //button clear
              document.getElementById('middleSignClear').addEventListener('click', function () {
                  signaturePad.clear();
              });

              // button action save-png  Event부여
              document.querySelector('[data-action="middleSignSave-png"]').addEventListener('click', function () {

                  let dataURL = signaturePad.toDataURL();

                  let downloadLink = document.createElement('a');
                  downloadLink.href = dataURL;
                  downloadLink.download = 'middleSignImage.png';
                  //다운로드 처리
                  document.body.appendChild(downloadLink);
                  downloadLink.click();
                  document.body.removeChild(downloadLink);
              });

              // button save
              document.getElementById('middleSignSave').addEventListener('click', function () {
                  let canvas = document.getElementById('middleSign-pad');
                  let dataURL = canvas.toDataURL('image/png'); // 캔버스 내용을 데이터 URL로 가져옴
                  // 데이터 URL을 Blob 객체로 변환
                  let blob = dataURItoBlob(dataURL);

                  // FormData 객체 생성
                  let formData = new FormData();
                  formData.append('image', blob, '<%=approvalVO.getApproval_no()%>_middleSign.png');

                  $.ajax({
                      type: 'POST',
                      url: '/approvalSignSave',
                      data: formData,
                      processData: false, // FormData를 처리하지 않도록 설정
                      contentType: false, // 컨텐츠 타입을 false로 설정하여 jQuery가 컨텐츠 타입을 설정하지 않도록 함
                      success: function (response) {
                          console.log('파일 전송 성공');
                          $('.modal').modal('hide');
                          document.querySelector("#middleSignImage").src = "/fileUpload/approvalSign/<%=approvalVO.getApproval_no()%>_middleSign.png";
                          signaturePad.clear();
                      },
                      error: function (xhr, status, error) {
                          console.error('파일 전송 실패:', error);
                          // 실패한 경우 처리할 내용 추가
                      }
                  });

                  // 데이터 URL을 Blob 객체로 변환하는 함수
                  function dataURItoBlob(dataURI) {
                      // Base64 데이터 부분 분리
                      let byteString = atob(dataURI.split(',')[1]);
                      let mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
                      // Blob 객체 생성
                      let arrayBuffer = new ArrayBuffer(byteString.length);
                      let intArray = new Uint8Array(arrayBuffer);
                      for (let i = 0; i < byteString.length; i++) {
                          intArray[i] = byteString.charCodeAt(i);
                      }
                      return new Blob([arrayBuffer], {type: mimeString});
                  }
              })
          </script>
        </form>

      </div>
    </div>
  </div>
</div>
<%
  }else{
%>
<div class="modal" id="finalSignSelect">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content rounded-4 shadow">
      <div class="modal-header p-5 pb-0 border-bottom-0" style="margin-bottom: -20px;">
        <h1 class="fw-bold  fs-2" >전자서명변경</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body p-5 pt-0">
        <form id="finalSignInsert" method="post" action="/approvalSignSave" enctype="multipart/form-data">
          <canvas id="finalSign-pad" width=400 height=200 style="margin-bottom: 20px; border: 2px solid black"></canvas>
          <input type="hidden" id="emp_no" name="emp_no" value="">
          <div>
            <button type="button" id="finalSignClear" class="btn btn-danger">초기화</button>
            <button type="button" id="finalSignSave" class="btn btn-danger">저장</button>
            <button type="button" class="btn btn-danger button save" data-action="save-png">내 pc에 저장</button>
          </div>
          <script>
              let canvas = document.getElementById('finalSign-pad');
              let signaturePad = new SignaturePad(canvas);


              //button clear
              document.getElementById('finalSignClear').addEventListener('click', function () {
                  signaturePad.clear();
              });

              // button action save-png  Event부여
              document.querySelector('[data-action="save-png"]').addEventListener('click', function () {

                  let dataURL = signaturePad.toDataURL();

                  let downloadLink = document.createElement('a');
                  downloadLink.href = dataURL;
                  downloadLink.download = 'middleSignImage.png';
                  //다운로드 처리
                  document.body.appendChild(downloadLink);
                  downloadLink.click();
                  document.body.removeChild(downloadLink);
              });

              // button save
              document.getElementById('finalSignSave').addEventListener('click', function () {
                  let canvas = document.getElementById('finalSign-pad');
                  let dataURL = canvas.toDataURL('image/png'); // 캔버스 내용을 데이터 URL로 가져옴
                  // 데이터 URL을 Blob 객체로 변환
                  let blob = dataURItoBlob(dataURL);

                  // FormData 객체 생성
                  let formData = new FormData();
                  formData.append('image', blob, '<%=approvalVO.getApproval_no()%>_finalSign.png');

                  $.ajax({
                      type: 'POST',
                      url: '/approvalSignSave',
                      data: formData,
                      processData: false, // FormData를 처리하지 않도록 설정
                      contentType: false, // 컨텐츠 타입을 false로 설정하여 jQuery가 컨텐츠 타입을 설정하지 않도록 함
                      success: function (response) {
                          console.log('파일 전송 성공');
                          $('.modal').modal('hide');
                          document.querySelector("#finalSignImage").src = "/fileUpload/approvalSign/<%=approvalVO.getApproval_no()%>_finalSign.png";
                          signaturePad.clear();
                      },
                      error: function (xhr, status, error) {
                          console.error('파일 전송 실패:', error);
                          // 실패한 경우 처리할 내용 추가
                      }
                  });

                  // 데이터 URL을 Blob 객체로 변환하는 함수
                  function dataURItoBlob(dataURI) {
                      // Base64 데이터 부분 분리
                      let byteString = atob(dataURI.split(',')[1]);
                      let mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
                      // Blob 객체 생성
                      let arrayBuffer = new ArrayBuffer(byteString.length);
                      let intArray = new Uint8Array(arrayBuffer);
                      for (let i = 0; i < byteString.length; i++) {
                          intArray[i] = byteString.charCodeAt(i);
                      }
                      return new Blob([arrayBuffer], {type: mimeString});
                  }
              })
          </script>
        </form>

      </div>
    </div>
  </div>
</div>
<%
  }
%>

</body>
</html>
<%--
<!-- 单个表单 -->
<form id="approvalForm" method="post" action="/updateApproval">
    <!-- 其他表单字段 -->

    <!-- 隐藏的input，用于存储操作类型 -->
    <input type="hidden" id="gubunInput" name="gubun" value=""/>

    <!-- “同意”按钮，点击时调用JavaScript函数设置gubun的值并提交表单 -->
    <button type="button" class="btn btn-success" onclick="submitForm('true')">同意</button>

    <!-- “驳回”按钮，点击时调用JavaScript函数设置gubun的值并提交表单 -->
    <button type="button" class="btn btn-danger" onclick="submitForm('false')">驳回</button>
</form>

<script>
    function submitForm(action) {
        // 设置隐藏input的值
        document.getElementById('gubunInput').value = action;

        // 提交表单
        document.getElementById('approvalForm').submit();
    }
</script>
참고코드

--%>