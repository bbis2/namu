<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container body-container">
  <div class="inner-page-container">
    <div class="inner-page">
      <img class="inner-page" src="${pageContext.request.contextPath}/resources/images/namu2.png" alt="Namu Image">
    </div>
    <div class="inner-page2">

      <div id="carouselExample" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="inner-page2" src="${pageContext.request.contextPath}/resources/images/slide1.png" class="d-block w-100">
          </div>
          <div class="carousel-item">
            <img class="inner-page2" src="${pageContext.request.contextPath}/resources/images/slide2.png" class="d-block w-100">
          </div>
          <div class="carousel-item">
            <img class="inner-page2" src="${pageContext.request.contextPath}/resources/images/slide3.png" class="d-block w-100">
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
.container {
  display: flex;
  justify-content: center;
  align-items: center;
}

.body-container {
  clear: both;
  margin: 0 auto 10px;
  min-height: 500px;
  margin-top: 53px;
}

.inner-page-container {
  display: flex;
  flex-wrap: wrap;
  width: 100%;
  gap: 20px;
}

.inner-page {
  width: 790px;
  height: 500px;
  flex: 1;
  min-width: calc(73% - 20px);
  border-radius: 20px;
}

.inner-page img.inner-page {
  max-width: 100%;
  max-height: 100%;
}

.inner-page2 {
  height: 500px;
  flex: 1;
  min-width: calc(25% - 20px); 
  border-radius: 20px;
}

@media screen and (max-width: 768px) {
  .inner-page, .inner-page2 {
    min-width: 100%;
  }
}

</style>