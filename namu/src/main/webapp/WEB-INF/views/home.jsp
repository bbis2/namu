<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container body-container">
  <div class="inner-page-container">
    <div class="inner-page">
      <img class="img1" src="${pageContext.request.contextPath}/resources/images/namu_used.png" alt="Namu Image">
    </div>
    <div class="inner-page2">

      <div id="carouselExample" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="img2" src="${pageContext.request.contextPath}/resources/images/slide1.png" class="d-block w-100">
          </div>
          <div class="carousel-item">
            <img class="img2" src="${pageContext.request.contextPath}/resources/images/slide2.png" class="d-block w-100">
          </div>
          <div class="carousel-item">
            <img class="img2" src="${pageContext.request.contextPath}/resources/images/slide3.png" class="d-block w-100">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      
    </div>
      <h2>요즘 핫한 중고거래글!</h2>
  </div>
</div>

<style>

.inner-page-container {
  display: flex;
  flex-wrap: wrap;
  width: 100%;
  gap: 20px;
}

.inner-page {
  height: 500px;
  flex: 1;
}

.inner-page img.inner-page {
  max-width: 100%;
  max-height: 100%;
}

.inner-page2 {
  height: 500px;
  flex: 1;
}

.img1 {
  width: 1000px;
  height: 500px;
  flex: 1;
  border-radius: 5px;
}

.img2 {
  width: 276px;
  height: 500px;
  flex: 1;
  border-radius: 5px;
}


@media screen and (max-width: 768px) {
  .inner-page, .inner-page2 {
    min-width: 100%;
  }
}

</style>