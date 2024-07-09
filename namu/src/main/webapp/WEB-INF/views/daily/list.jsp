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

.daily {
	size: 50px;
}
   
    
}

</style>

<div class="container">

<section class="fleamarket-cover">

    <div class="cover-content">
      <h1 class="cover-title">함께하는<br>나무 일상</h1>
      <span class="cover-description">동네 주민들과 함께하는 <br> 동네 일상 !</span>
      <div class="cover-image">
        <span class="fleamarket-cover-image">
          <img srcset="https://d1unjqcospf8gs.cloudfront.net/assets/home/main/3x/fleamarket-39d1db152a4769a6071f587fa9320b254085d726a06f61d544728b9ab3bd940a.webp " alt="믿을만한 이웃 간 중고거래" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/main/3x/fleamarket-39d1db152a4769a6071f587fa9320b254085d726a06f61d544728b9ab3bd940a.webp">
        </span>
        <span class="fleamarket-cover-image-mobile">
          <img srcset="https://d1unjqcospf8gs.cloudfront.net/assets/home/main/mobile/3x/fleamarket-1caf5c24c82acb20bd86fa8c018987be7812a1f0ce0858dcf175568bfc3cf87d.webp 3x" alt="믿을만한 이웃 간 중고거래" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/main/mobile/3x/fleamarket-1caf5c24c82acb20bd86fa8c018987be7812a1f0ce0858dcf175568bfc3cf87d.webp">
        </span>
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