<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 전체 페이지 스타일 */
    body 
  	{
    	font-family: 'goorm-sans-bold', sans-serif;
    	background-color: #f2f4f9;
    	margin: 0;
    	padding: 0;
  	}	
    
    section 
  	{
 	    width: 80%;
 	    max-width: 550px;
    	margin: 50px auto;
    	padding: 60px;
    	background-color: #ffffff;
    	border-radius: 40px;
    	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  	}

    /* 제목 스타일 */
    h3 {
        text-align: center;
        color: #B5B2FF;
        margin-bottom: 20px;
        font-size:22px;
    }
    
    h4 {
    	text-align: center;
        color: #B5B2FF;
        font-size:20px;
        margin-top: 10px;
        margin-bottom: 20px;
    }
    
    div 
  	{
    	margin: auto;
 	}

    /* 입력 필드 스타일 */
    input[type="text"]
    {
    	font-family: 'goorm-sans-bold', sans-serif;
        width: 99%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 10px;
        font-size: 14px;
        outline: none;
    }
    
    input[type="file"]
    {
    	font-family: 'goorm-sans-bold', sans-serif;
        
    }
    
    textarea
    {
    	font-family: 'goorm-sans-bold', sans-serif;
    	width: 99%;
    	height:200px;
    	margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 10px;
        font-size: 14px;
        outline: none;
    }

    /* 버튼 스타일 */
    input[type="button"] 
    {
    	font-family: 'goorm-sans-bold', sans-serif;
        width: 49%;
        padding: 10px;
        margin-top: 10px;
        margin-bottom: 15px;
        background-color: #B5B2FF;
        border: none;
        border-radius: 10px;
        color: white;
        font-size: 14px;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    
    input[type="submit"]
    {
    	font-family: 'goorm-sans-bold', sans-serif;
    	width: 99%;
        padding: 10px;
        margin-top: 30px;
        margin-bottom: 10px;
        background-color: #B5B2FF;
        border: none;
        border-radius: 10px;
        color: white;
        font-size: 14px;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    input[type="button"]:hover,
    input[type="submit"]:hover {
        background-color: #7D78FF;
    }

    /* 이미지 미리보기 스타일 */
    .img img {
        margin-top: 10px;
        max-width: 100px;
        max-height: 100px;
        border-radius: 10px;
        border: 1px solid #ddd;
    }

    /* 사진 등록 부분 스타일 */
    .one {
        align-items: center;
        margin-bottom: 10px;
    }

    .one label {
        margin-right: 10px;
    }

</style>
<script>
	function add()
	{
	  var len=document.getElementsByClassName("file").length;
	  
	  if(len<10)
	  {
		  var one=document.getElementById("one");
		  var inner=one.cloneNode(true);
		  var outer=document.getElementById("outer"); 
		  outer.appendChild(inner);
		  document.getElementsByClassName("file")[len].name="fname"+len;
		  document.getElementsByClassName("file")[len].value="";
		  document.getElementsByClassName("img")[len].innerHTML="";
		  document.getElementsByClassName("label")[len].setAttribute("for","fileUp"+len);
		  document.getElementsByClassName("file")[len].id="fileUp"+len; 
	  }	  
	  
	}
	
	function del()
	{
	  var len=document.getElementsByClassName("file").length;
	  if(len>1)
	  {	  
	      document.getElementsByClassName("one")[len-1].remove();
	  }
	}
	
	function previewImage(event) 
	{
		  var input=event.target; // 파일 입력 요소
		  var reader=new FileReader();

		  reader.onload = function() 
		  {
			  var imgElement=input.nextElementSibling; // .img 요소 (span)
			  imgElement.innerHTML="<img src='"+reader.result+" 'alt='이미지 미리보기' width='100px' height='100px'>";
		  }

		  if(input.files && input.files[0]) 
		  {
			  reader.readAsDataURL(input.files[0]); // 파일을 읽어서 Data URL로 변환
		  }
		  
	}
</script>
</head>
<body>
 <section>
   <form method="post" action="notice_writeOk">
     <caption> <h3> 공지 글쓰기 </h3> </caption>
     <div> 
     	<input type="text" name="title" placeholder="제 목"> 
     </div>
     <div> 
     	<textarea name="content" placeholder="내 용"> </textarea>
     </div>
     <div> 
     	
     </div>
     <div id="outer"> 
       <h4> 사진 등록 </h4>
       <div> 
     		<input type="button" value="추가" onclick="add()"> 
     		<input type="button" value="삭제" onclick="del()"> 
    	</div>
     	<div id="one" class="one">
           <label for="fileUp0" class="label"> </label>
           <input type="file" id="fileUp0" name="fname0" class="file" onchange="previewImage(event)"> 
           <span class="img"></span>
       </div>
     </div>
     <div> <input type="submit" value="후기 등록"> </div>
   </form>
 </section>

</body>
</html>