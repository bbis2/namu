<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}

.fleamarket-cover {
    background-color: #E3F1C5;
}

h1 {
    display: block;
    font-size: 2em;
    margin-block-start: 0.67em;
    margin-block-end: 0.67em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
    unicode-bidi: isolate;
}
.cover-content {
	padding: 50px;
    position: relative;
    height: 100%;
    box-sizing: border-box;
    margin-left: 100px;
}

@media (min-width: 768px) {
    .fleamarket-cover {
        height: 315px;
        padding: 0 16px 0 16px;
        margin-top: 60px;
    }
   
    
}

</style>

<div class="container">

<section class="fleamarket-cover">
    <div class="cover-content">
      <h1 class="cover-title">믿을만한<br>나무 거래</h1>
      <span class="cover-description">나: 나누고 싶은 마음을 담아<br>무: 무한한 가능성을 거래합니다.</span>
      <div class="cover-image">
      </div>
    </div>
  </section>
	<div class="body-container">
		<div class="body-title">
			<h3><i class="bi bi-app"></i> 제목 </h3>
		</div>
		
		<div class="body-main">
			내용 입니다.
		</div>
	</div>
</div>