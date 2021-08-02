<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <dt class="first">제  목 :</dt>
                <dd class="first">${board.boardName }</dd>
                <dt class="dt_type2">작성자 :</dt>
                <dd class="dd_type3 targetName">${board.boardWriter.nickname}</dd>
                <dt><span> 사유선택</span> :</dt>
                <dd class="dd_type">
                    <p class="desc5">대표적인 신고사유 한개를 선택해주세요.
                    </p>
                    <ul class="list_type">
                        <li>
                            <input type="radio" name="badArticleReport.badType" id="rdo_illegal" value="AA03" class="input_rdo"><label for="rdo_illegal">부적절한 홍보 게시글 </label>
                            <strong><span class="more"><a href="#" onclick="changeInfoLayer('info_illegal','img_illegal');"><img id="img_illegal" src="https://ssl.pstatic.net/static/common/popup/img_more.gif" width="36" height="11" alt="´õº¸±â"></a></span></strong>
                        </li>
                        <li>
                            <input type="radio" name="badArticleReport.badType" id="rdo_obscenity" value="AA33" class="input_rdo"> <label for="rdo_obscenity">음란성 또는 욕설 등 부적합한 내용</label>
                            <span class="more"><a href="#" onclick="changeInfoLayer('info_obscenity','img_obscenity');"><img id="img_obscenity" src="https://ssl.pstatic.net/static/common/popup/img_more.gif" width="36" height="11" alt="´õº¸±â"></a></span>
                            <ul id="info_obscenity" class="list_type2" style="display:none">
                            </ul>
                        </li>
                        <li>
                            <input type="radio" name="badArticleReport.badType" id="rdo_libel" value="NOT_SUBMIT" class="input_rdo"> <label for="rdo_libel">불법관련 게시글</label>
                        </li>
                    </ul>

                    <textarea name="badArticleReport.reportDesc" id="etcTxtBox" cols="50" rows="5" class="txt_area" style="width:405px; height:80px;">상세내용을 입력해주세요.
                    </textarea>
                </dd>
            </dl>
        </div>
    </div>
    
    <div id="pop_footer">
        <input type="image" id="btnReport" src="https://ssl.pstatic.net/static/common/popup/btn_report2.gif" alt="½Å°íÇÏ±â" title="½Å°íÇÏ±â" onMouseOver="this.src='https://ssl.pstatic.net/static/common/popup/btn_report2_over.gif'" onMouseOut="this.src='https://ssl.pstatic.net/static/common/popup/btn_report2.gif'" onclick="return submitForm();">
        <a href="javascript:window.close()"><img src="https://ssl.pstatic.net/static/common/popup/btn_cancel2.gif" width="48" height="28" alt="Ãë¼Ò" onMouseOver="this.src='https://ssl.pstatic.net/static/common/popup/btn_cancel2_over.gif'" onMouseOut="this.src='https://ssl.pstatic.net/static/common/popup/btn_cancel2.gif'"></a>
    </div>
</div>
</form>

</body>
</html>