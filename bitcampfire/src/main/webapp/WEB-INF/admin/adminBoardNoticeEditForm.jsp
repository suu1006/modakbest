<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/semiproject/css/board/boardWriteForm.css">
<link rel="stylesheet" href="/semiproject/css/board/userProfile.css">

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="/semiproject/css/board/application.css">
<script src="https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script>
</head>
<body>

<div class="layout-container">
	<div class="main">
		<!-- 풍혁 (220707) : 보드 고정 사이드바 jsp include -->
			 <jsp:include page="/WEB-INF/board/boardSideBar.jsp"/>
		<!-- 풍혁 (220707) : 보드 고정 사이드바 jsp include -->
		
		<!-- 풍혁(220707) : 보드 작성 폼 -->
		<div id="article-create" class="content" role="main">
			<!-- 풍혁(220707) : css 분리 적용을 위해, class eunhye를 추가하겠습니다. -->
			<div class="content-header">
	    		<h3>공지사항 수정</h3>
				<input type = "hidden" id = "board_id" class = "board_id" value = "${param.board_id}">
				<input type = "hidden" id = "category" class = "category" value = "${param.category}"> 
			</div>
			<div class="content-header">
				<div class="user-profile">
					<!-- 연수 : 세션값 아니고 DTO로 값 넣어주기!  -->
					<a id="user_imgDiv" href="">
						<img src="" id="profile-photo" alt="profile-img">
					</a>
					
					<div class="profile-info">
						 <h1 class="eunhye">
		                    <a id="user_nicknameDiv" href="">
		                    	 <!-- author nickname --> 
		                    </a>
		                </h1>
		                <span aria-label="">point</span>
					</div>
				</div>
			</div>
			
			<div class="content-body">
				<form name="adminBoardNoticeWriteForm" id="adminBoardNoticeWriteForm">
		
					<div class="content-body-article">
						<table name="adminBoardNoticeWriteTable" id="adminBoardNoticedWriteTable" >
							<tr>
								<td>
									  <select class="eunhye" id="board_cateid" required>
									    <option value="" selected value="0" >게시판을 선택해 주세요</option>
									    <option value="6">전체공지</option>
									    <option value="1">취업정보</option>
									    <option value="2">후기</option>
									    <option value="3">Q &amp; A</option>
									    <option value="4">자유게시판</option>
									    <option value="5">학원전용게시판</option>
									  </select>        
								</td>
							</tr>
							<tr>
								<td>
									<label for="title" class="eunhye">제목</label>
									<div><input type="text" name="board_title" class="eunhye" id="board_title" placeholder="제목을 입력해 주세요."></div>
									<div class="alertMsg" id="board_titleDiv"></div> 
								</td>
							</tr>
							<tr>
								<td>	
									<label for="Tags">태그</label>
									<div><input type="text" class="eunhye" id="board_tags" name="board_tags" placeholder="Tags." ></div>
								</td>
							</tr>
							<tr>
								<td>
									<!-- @@@@@ 연수 : admin> boardedit - ckeditor 업로드  수정(220727)@@@@@	 -->	 									                        
			                        <!-- id값을  content로 해줘야 ckeditor가 적용됨  -->
			                        <textarea rows="5" cols="50" id="content" name="content"></textarea>
			                        <script type="text/javascript">													
									 CKEDITOR.replace('content',
										/* 이미지 업로드 컨트롤러 실행  */	 
										{filebrowserUploadUrl:'/semiproject/admin/uploadImageFileByCkAtAdmin'
										});
									</script>
									<!-- @@@@@ 연수 : admin> boardedit - ckeditor 업로드  수정(220727)@@@@@	 -->	
								</td>
							</tr>		
						</table>
						
						<!-- 풍혁(220707) : 이렇게 요소에 style로 들어오면 안될거 같깉한데.. 일단 display 해야하니깐 ... -->	
						<fieldset class="buttons" style="width: 630px; margin-top: 10px;">
	                       <!-- 연수 : 취소했을 경우 다시 view 페이지로  -->
	                       <a href="/semiproject/admin/getAdminBoardNoticeView?category=${param.category}&board_id=${param.board_id}" class="btn btn-default btn-wide" onclick="return confirm('정말로 취소하시겠습니까?')">취소</a>
	                       <input type="button" name="create" class="create btn btn-success btn-wide pull-right" action="create" value="등록" id="adminBoardNoticeUpdateBtn">
	                    </fieldset>
							
					</div>
				</form>
			</div>
		</div>
		<!-- 풍혁(220707) : 보드 작성 폼 -->
			
		<!-- 풍혁 (220707) : 보드 유저 공용 푸터 jsp include -->
			<jsp:include page="/WEB-INF/global/footer.jsp"/>
		<!-- 풍혁 (220707) : 보드 유저 공용 푸터 jsp include -->
		
	</div> <!-- <div class="main"> -->
</div> <!-- <div class="layout-container"> -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 연수 : js파일 별도 생성 (220726) -->
<script type="text/javascript" src="/semiproject/js/admin/adminBoardNoticeEditForm.js"></script>
</body>
</html>