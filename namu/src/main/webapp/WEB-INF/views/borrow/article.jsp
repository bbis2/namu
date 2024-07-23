<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

.btnLike {
	background: #b1b1b1;
	color: white;
	width: 150px;
	height: 50px;
	border: none;
	font-size: 18px;
	font-weight: 700;
	transition: 0.2s;
	
}
.btnChat {
	background: #ec433d;
	color: white;
	width: 150px;
	height: 50px;
	border: none;
	font-size: 18px;
	font-weight: 700;
	transition: 0.2s;
}

.btnLike:hover {
	background: #8a8a8a;
}
.btnChat:hover {
	background: #ff2600;
}

a:hover {text-decoration: none;}

.profileList {
	display: block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

</style>

<script type="text/javascript">
function searchList() {
	const form = document.searchForm;
	
	form.action = "${pageContext.request.contextPath}/borrow/list";
	form.submit();
}
</script>


<div class="container mt-5 pt-3">

	<div class="row mt-4">
		<form class="d-flex w-100" id="searchForm" action="${pageContext.request.contextPath}/borrow/list" method="GET">
			<div class="col-3">
				<div>
					<h6>&nbsp;</h6>
					<h5><a style="color: #bfbfbf;" href="${pageContext.request.contextPath}/borrow/list?${query}">> [${dto.category}]의 모든 글 보기</a></h5>
				</div>
			</div>
			<div class="col-9">
				<div class="row d-flex justify-content-end">
					<div class="col-2">
						<div>
							<h6 class="bd">나의 동네</h6>
							<select id="selectTown" class="form-select mb-4 border border-2" aria-label="Default select example" name="townNum">
								<option value="1" ${townNum=="1" ? "selected" : "" }>${sessionScope.member.town1}</option>
								<c:if test="${sessionScope.member.town2 != null}">
									<option value="2" ${townNum=="2" ? "selected" : "" }>${sessionScope.member.town2}</option>
								</c:if>
							</select>
						</div>
					</div>
					<div class="col-2">
						<div>
							<h6 class="bd">카테고리</h6>
							<select class="form-select mb-4 border border-2" aria-label="Default select example" name="categoryNum">
								<option value="0" ${categoryNum=="0" ? "selected" : ""}>전체</option>
								<c:forEach var="category" items="${category}">
									<option value="${category.categoryNum}" ${category.categoryNum==categoryNum ? "selected" : ""}>${category.category}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-4">
						<div>
							<h6 class="bd">&nbsp;</h6>
						</div>
						<div class="d-flex">
							<input class="form-control border border-2" onkeypress="if( event.keyCode == 13 ){searchList();}" value="${kwd}" type="search" name="kwd" placeholder="검색어를 입력하세요"/>
							<h6>&nbsp;</h6>
							<button class="btn" type="submit">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<hr class="my-4"  style="border: 1px solid #000000;">

	<div class="row mb-4 mx-5 px-5">
		<div class="col-md-4">
		
			<div id="carouselExampleIndicators" class="carousel slide border">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner ratio ratio-1x1">
					<c:forEach var="i" items="${listImage}">
						<div class="carousel-item active">
							<img src="${pageContext.request.contextPath}/uploads/album/${i.imageFilename}" class="d-block w-100 object-fit-cover h-100" alt="...">
						</div>
					</c:forEach>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>

		</div>
		
		<div class="col-md-8">
			<div class="ms-5 mb-4 me-4">
				<h3 class="bd">${dto.subject}</h3>
				<div class="d-flex justify-content-between">
					<h5><a href="${pageContext.request.contextPath}/"><i class="fa-solid fa-circle-user"></i>&nbsp;${dto.nickName}</a></h5>
					<div class="d-flex gap-3 justify-content-end" style="color: #bfbfbf;">
						<p><i class="fa-solid fa-heart"></i>&nbsp;7</p>
						<p>|</p>
						<p><i class="fa-solid fa-eye"></i>&nbsp;${dto.hitCount}</p>
						<p>|</p>
						<p><i class="fa-solid fa-clock"></i>&nbsp;${dto.passedTime}</p>
					</div>
				</div>
				<div class=""><i class="fa-solid fa-location-dot"></i>&nbsp;${dto.location}</div>	
				
				<div class="mt-5 pt-4">
					<div class="d-flex my-2">
						<h6 style="width: 130px; color: #ababab;">• 대여희망기간</h6>
						<h6>${dto.strDate} ~ ${dto.endDate}</h6>
					</div>
					<div class="d-flex my-2">
						<h6 style="width: 130px; color: #ababab;">• 희망금액</h6>
						<h6 class="bd">${dto.price}원</h6>
					</div>
				</div>
				
				<div class="mt-5 pt-3">
					<div class="d-flex justify-content-end gap-3">
						<button class="btnLike">찜하기</button>
						<button class="btnChat">채팅하기</button>
					</div>
				</div>
			</div>		
		</div>
		
		
		
		<div class="row">
			<div class="col">
			</div>
		</div>

		<div class="row mb-2">
	        <div class="col-md-8">
	            <div class="mt-3">
	                <h5 class="bd">본문</h5>
	                <hr class="mt-0 mb-2">
	                <div>
	                	${dto.content}
	                </div>
	            </div>
	        </div>
	        
	        <div class="col-md-4 profile">
                <div class="mt-3">
                    <h5 class="bd">프로필</h5>
	                <hr class="mt-0 mb-2">
                    <div class="mx-3">
                    	<div class="d-flex justify-content-between">
                    		<div class="mt-3">
			                    <h3><a href="${pageContext.request.contextPath}/"><i class="fa-solid fa-circle-user"></i>&nbsp;${dto.nickName}</a></h3>
			                    <div class="d-flex">
				                    한마디: <p class="bd ms-1">${writer.ment}</p>
			                    </div>
                    		</div>
		                    <div>
			                    <p>가입일 | ${writer.regDate}</p>
			                    <div class="d-flex">
									<img alt="" src="${pageContext.request.contextPath}/resources/images/namuLogo.png" width="40px;" height="40px;">
				                    <p class="bd"><br>${writer.userManner}cm</p>
			                    </div>
		                    </div>
                    	</div>
	                    <p class="bd mb-1">${dto.nickName}님의 다른 글</p>
	                    <hr class="mt-0">
	                    <div><a class="profileList" href="${pageContext.request.contextPath}/">[빌림] ~~빌립니다!!</a></div>
	                    <div><a class="profileList" href="${pageContext.request.contextPath}/">[경매] 초 희귀 렘!! 클리...!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</a></div>
                    </div>
	            </div>
	        </div>
	    </div>
	        
	    <div class="row">
	    	<div class="col-md-8">
	        	<h5 class="bd">빌림의 다른 글</h5>
	    	</div>
        	<hr>
	    </div>
	    <div class="row align-items-start ">
	    	
	    	
	    
	    	<!-- 다른글 시작 -->	
		    
		    <div class="col-lg-20 col-md-3 col-sm-6 list">
				<div>
					<div class="overflow-hidden border mb-2 ratio ratio-1x1">
						<a href="${pageContext.request.contextPath}/borrow/article" class="listTitle">
							<img class="img-fluid object-fit-cover h-100" alt="" src="${pageContext.request.contextPath}/resources/images/camera.png">
						</a>
						<button class="btn_like">like</button>
					</div>
					<a href="${pageContext.request.contextPath}/" class="listTitle"> <h5 class="bd">contax t3 빌려요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</h5> </a>
					<a href="${pageContext.request.contextPath}/"><i class="fa-solid fa-circle-user"></i>&nbsp;나무조아</a>
					<div class="float-end"><i class="fa-solid fa-location-dot"></i>&nbsp;중산동</div>	
					<div class="d-flex justify-content-between mt-2" style="color: #bfbfbf;">
						<p><i class="fa-solid fa-heart"></i>&nbsp;7</p>
						<p><i class="fa-solid fa-eye"></i>&nbsp;789</p>
						<p><i class="fa-solid fa-clock"></i>&nbsp;3일전</p>
					</div>
				</div>
			</div>
		    <div class="col-lg-20 col-md-3 col-sm-6 list">
				<div>
					<div class="overflow-hidden border mb-2 ratio ratio-1x1">
						<a href="${pageContext.request.contextPath}/borrow/article" class="listTitle">
							<img class="img-fluid object-fit-cover h-100" alt="" src="${pageContext.request.contextPath}/resources/images/camera.png">
						</a>
						<button class="btn_like">like</button>
					</div>
					<a href="${pageContext.request.contextPath}/" class="listTitle"> <h5 class="bd">contax t3 빌려요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</h5> </a>
					<a href="${pageContext.request.contextPath}/"><i class="fa-solid fa-circle-user"></i>&nbsp;나무조아</a>
					<div class="float-end"><i class="fa-solid fa-location-dot"></i>&nbsp;중산동</div>	
					<div class="d-flex justify-content-between mt-2" style="color: #bfbfbf;">
						<p><i class="fa-solid fa-heart"></i>&nbsp;7</p>
						<p><i class="fa-solid fa-eye"></i>&nbsp;789</p>
						<p><i class="fa-solid fa-clock"></i>&nbsp;3일전</p>
					</div>
				</div>
			</div>
		    <div class="col-lg-20 col-md-3 col-sm-6 list">
				<div>
					<div class="overflow-hidden border mb-2 ratio ratio-1x1">
						<a href="${pageContext.request.contextPath}/borrow/article" class="listTitle">
							<img class="img-fluid object-fit-cover h-100" alt="" src="${pageContext.request.contextPath}/resources/images/camera.png">
						</a>
						<button class="btn_like">like</button>
					</div>
					<a href="${pageContext.request.contextPath}/" class="listTitle"> <h5 class="bd">contax t3 빌려요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</h5> </a>
					<a href="${pageContext.request.contextPath}/"><i class="fa-solid fa-circle-user"></i>&nbsp;나무조아</a>
					<div class="float-end"><i class="fa-solid fa-location-dot"></i>&nbsp;중산동</div>	
					<div class="d-flex justify-content-between mt-2" style="color: #bfbfbf;">
						<p><i class="fa-solid fa-heart"></i>&nbsp;7</p>
						<p><i class="fa-solid fa-eye"></i>&nbsp;789</p>
						<p><i class="fa-solid fa-clock"></i>&nbsp;3일전</p>
					</div>
				</div>
			</div>
		    <div class="col-lg-20 col-md-3 col-sm-6 list">
				<div>
					<div class="overflow-hidden border mb-2 ratio ratio-1x1">
						<a href="${pageContext.request.contextPath}/borrow/article" class="listTitle">
							<img class="img-fluid object-fit-cover h-100" alt="" src="${pageContext.request.contextPath}/resources/images/camera.png">
						</a>
						<button class="btn_like">like</button>
					</div>
					<a href="${pageContext.request.contextPath}/" class="listTitle"> <h5 class="bd">contax t3 빌려요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</h5> </a>
					<a href="${pageContext.request.contextPath}/"><i class="fa-solid fa-circle-user"></i>&nbsp;나무조아</a>
					<div class="float-end"><i class="fa-solid fa-location-dot"></i>&nbsp;중산동</div>	
					<div class="d-flex justify-content-between mt-2" style="color: #bfbfbf;">
						<p><i class="fa-solid fa-heart"></i>&nbsp;7</p>
						<p><i class="fa-solid fa-eye"></i>&nbsp;789</p>
						<p><i class="fa-solid fa-clock"></i>&nbsp;3일전</p>
					</div>
				</div>
			</div>
		    <div class="col-lg-20 col-md-3 col-sm-6 list">
				<div>
					<div class="overflow-hidden border mb-2 ratio ratio-1x1">
						<a href="${pageContext.request.contextPath}/borrow/article" class="listTitle">
							<img class="img-fluid object-fit-cover h-100" alt="" src="${pageContext.request.contextPath}/resources/images/camera.png">
						</a>
						<button class="btn_like">like</button>
					</div>
					<a href="${pageContext.request.contextPath}/" class="listTitle"> <h5 class="bd">contax t3 빌려요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</h5> </a>
					<a href="${pageContext.request.contextPath}/"><i class="fa-solid fa-circle-user"></i>&nbsp;나무조아</a>
					<div class="float-end"><i class="fa-solid fa-location-dot"></i>&nbsp;중산동</div>	
					<div class="d-flex justify-content-between mt-2" style="color: #bfbfbf;">
						<p><i class="fa-solid fa-heart"></i>&nbsp;7</p>
						<p><i class="fa-solid fa-eye"></i>&nbsp;789</p>
						<p><i class="fa-solid fa-clock"></i>&nbsp;3일전</p>
					</div>
				</div>
			</div>
			<!-- 다른글 끝 -->
	    </div>
        
	</div>
</div>

