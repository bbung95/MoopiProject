<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>

<script type="text/javascript">


var hasFocusEtcTxtBox = false;


<script type="text/javascript">
var initWidth = "538";
var initHeight = "";
var maxHeight = "";

LH.add("setWindowSize('"+initWidth+"', '"+initHeight+"', '"+maxHeight+"')");
</script>
</head>

<body>

<form name="frm" method="post" action="/BoardReportBadArticle.nhn">
<input type=hidden name='badArticleReport.clubid' value='12730407'>
<input type=hidden name='badArticleReport.articleid' value='3086316'>
<input type=hidden name='badArticleReport.menuid' value='10'>
<input type=hidden name='m' value='article'>

<input type=hidden name='revisionid' value=''>

<div id="pop_wrap" style="width:530px;">
    <div id="pop_header">
        <h1>신고하기</h1>
    </div>
    
    <div id="pop_container">
        <div id="pop_content">
            <dl class="list_report">
                <dt class="first">제&nbsp;&nbsp;&nbsp;목 :</dt>
                <dd class="first">안동 태화주공 아파트</dd>
                <dt class="dt_type2">작성자 :</dt>
                <dd class="dd_type3">아기다람쥐a(k753****)</dd>
                <dt><span>사유선택</span> :</dt>
                <dd class="dd_type">
                    <p class="desc5">여러 사유에 해당되는 경우, 대표적인 사유 1개를 선택해 주세요
                        <span><a target="_blank" href="https://cafe.naver.com/common/cafein_service_use.htm">운영원칙 자세히 보기</a></span>
                    </p>
                    <ul class="list_type">
                        <li>
                            <input type="radio" name="badArticleReport.badType" id="rdo_illegal" value="AA03" class="input_rdo"><label for="rdo_illegal">&nbsp;부적절한 홍보 게시글</label>
                            <strong><span class="more"><a href="#" onclick="changeInfoLayer('info_illegal','img_illegal');"><img id="img_illegal" src="https://ssl.pstatic.net/static/common/popup/img_more.gif" width="36" height="11" alt="더보기"></a></span></strong>
                            <ul id="info_illegal" class="list_type2" style="display:none">
                                <li>불법 사행성, 도박 사이트를 홍보하는 경우</li>
                                <li>개인정보, 이미테이션, 성인의약품, 마약, 대포폰 등 불법 제품 및<br>정보를 홍보, 판매하는 경우</li>
                                <li>성매매, 장기매매 등의 신체 관련 거래 정보</li>
                                <li>홍보/스팸성 내용을 반복하여 등록하는 경우</li>
                            </ul>
                        </li>
                        <li>
                            <input type="radio" name="badArticleReport.badType" id="rdo_obscenity" value="AA33" class="input_rdo"> <label for="rdo_obscenity">음란성 또는 청소년에게 부적합한 내용</label>
                            <span class="more"><a href="#" onclick="changeInfoLayer('info_obscenity','img_obscenity');"><img id="img_obscenity" src="https://ssl.pstatic.net/static/common/popup/img_more.gif" width="36" height="11" alt="더보기"></a></span>
                            <ul id="info_obscenity" class="list_type2" style="display:none">
                            <li>음란물 또는 음란한 행위(노골적인 성행위 장면)를 묘사하는 이미지/동영상</li>
                            <li>살해/상해/폭력 등 잔인한 장면을 묘사하는 이미지/동영상</li>
                            <li>중고 속옷 판매, 가출 유도 등의 청소년 유해 정보 공유</li>
                            </ul>
                        </li>
                        <li>
                            <input type="radio" name="badArticleReport.badType" id="rdo_libel" value="NOT_SUBMIT" class="input_rdo"> <label for="rdo_libel">명예훼손/사생활 침해 및 저작권침해등</label>
                        </li>
                        <li>
                            <input type="radio" name="badArticleReport.badType" id="rdo_illegal_photographs" value="NOT_SUBMIT" class="input_rdo"> <label for="rdo_illegal_photographs">불법촬영물등 신고</label>
                        </li>
                        <li>
                            <input type="radio" name="badArticleReport.badType" id="rdo_etc" value="AA34" class="input_rdo"> <label for="rdo_etc">기타</label>
                        </li>
                    </ul>

                    <textarea name="badArticleReport.reportDesc" id="etcTxtBox" cols="50" rows="5" class="txt_area" style="width:405px; height:80px;">해당 신고는 네이버 운영자에게 전달됩니다.
   					 우리 카페의 규정을 위반한 경우 매니저에게 문의해주세요.
                    </textarea>
                </dd>
                <dl class="list_report" id="noticeBox" style="display:none">
                    <dt class="dt_type3">신고하기<br>전에 잠깐!</dt>
                    <dd class="dt_type3" id="notice_description"></dd>
                </dl>
            </dl>
        </div>
    </div>
    
    <div id="pop_footer">
        <input type="image" id="btnReport" src="https://ssl.pstatic.net/static/common/popup/btn_report2.gif" alt="신고하기" title="신고하기" onMouseOver="this.src='https://ssl.pstatic.net/static/common/popup/btn_report2_over.gif'" onMouseOut="this.src='https://ssl.pstatic.net/static/common/popup/btn_report2.gif'" onclick="return submitForm();">
        <a href="javascript:window.close()"><img src="https://ssl.pstatic.net/static/common/popup/btn_cancel2.gif" width="48" height="28" alt="취소" onMouseOver="this.src='https://ssl.pstatic.net/static/common/popup/btn_cancel2_over.gif'" onMouseOut="this.src='https://ssl.pstatic.net/static/common/popup/btn_cancel2.gif'"></a>
    </div>
</div>
</form>

</body>
</html>