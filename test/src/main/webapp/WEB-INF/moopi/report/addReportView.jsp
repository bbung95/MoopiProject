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
        <h1>�Ű��ϱ�</h1>
    </div>
    
    <div id="pop_container">
        <div id="pop_content">
            <dl class="list_report">
                <dt class="first">��&nbsp;&nbsp;&nbsp;�� :</dt>
                <dd class="first">�ȵ� ��ȭ�ְ� ����Ʈ</dd>
                <dt class="dt_type2">�ۼ��� :</dt>
                <dd class="dd_type3">�Ʊ�ٶ���a(k753****)</dd>
                <dt><span>��������</span> :</dt>
                <dd class="dd_type">
                    <p class="desc5">���� ������ �ش�Ǵ� ���, ��ǥ���� ���� 1���� ������ �ּ���
                        <span><a target="_blank" href="https://cafe.naver.com/common/cafein_service_use.htm">���Ģ �ڼ��� ����</a></span>
                    </p>
                    <ul class="list_type">
                        <li>
                            <input type="radio" name="badArticleReport.badType" id="rdo_illegal" value="AA03" class="input_rdo"><label for="rdo_illegal">&nbsp;�������� ȫ�� �Խñ�</label>
                            <strong><span class="more"><a href="#" onclick="changeInfoLayer('info_illegal','img_illegal');"><img id="img_illegal" src="https://ssl.pstatic.net/static/common/popup/img_more.gif" width="36" height="11" alt="������"></a></span></strong>
                            <ul id="info_illegal" class="list_type2" style="display:none">
                                <li>�ҹ� ���༺, ���� ����Ʈ�� ȫ���ϴ� ���</li>
                                <li>��������, �̹����̼�, �����Ǿ�ǰ, ����, ������ �� �ҹ� ��ǰ ��<br>������ ȫ��, �Ǹ��ϴ� ���</li>
                                <li>���Ÿ�, ���Ÿ� ���� ��ü ���� �ŷ� ����</li>
                                <li>ȫ��/���Լ� ������ �ݺ��Ͽ� ����ϴ� ���</li>
                            </ul>
                        </li>
                        <li>
                            <input type="radio" name="badArticleReport.badType" id="rdo_obscenity" value="AA33" class="input_rdo"> <label for="rdo_obscenity">������ �Ǵ� û�ҳ⿡�� �������� ����</label>
                            <span class="more"><a href="#" onclick="changeInfoLayer('info_obscenity','img_obscenity');"><img id="img_obscenity" src="https://ssl.pstatic.net/static/common/popup/img_more.gif" width="36" height="11" alt="������"></a></span>
                            <ul id="info_obscenity" class="list_type2" style="display:none">
                            <li>������ �Ǵ� ������ ����(������� ������ ���)�� �����ϴ� �̹���/������</li>
                            <li>����/����/���� �� ������ ����� �����ϴ� �̹���/������</li>
                            <li>�߰� �ӿ� �Ǹ�, ���� ���� ���� û�ҳ� ���� ���� ����</li>
                            </ul>
                        </li>
                        <li>
                            <input type="radio" name="badArticleReport.badType" id="rdo_libel" value="NOT_SUBMIT" class="input_rdo"> <label for="rdo_libel">���Ѽ�/���Ȱ ħ�� �� ���۱�ħ�ص�</label>
                        </li>
                        <li>
                            <input type="radio" name="badArticleReport.badType" id="rdo_illegal_photographs" value="NOT_SUBMIT" class="input_rdo"> <label for="rdo_illegal_photographs">�ҹ��Կ����� �Ű�</label>
                        </li>
                        <li>
                            <input type="radio" name="badArticleReport.badType" id="rdo_etc" value="AA34" class="input_rdo"> <label for="rdo_etc">��Ÿ</label>
                        </li>
                    </ul>

                    <textarea name="badArticleReport.reportDesc" id="etcTxtBox" cols="50" rows="5" class="txt_area" style="width:405px; height:80px;">�ش� �Ű�� ���̹� ��ڿ��� ���޵˴ϴ�.
   					 �츮 ī���� ������ ������ ��� �Ŵ������� �������ּ���.
                    </textarea>
                </dd>
                <dl class="list_report" id="noticeBox" style="display:none">
                    <dt class="dt_type3">�Ű��ϱ�<br>���� ���!</dt>
                    <dd class="dt_type3" id="notice_description"></dd>
                </dl>
            </dl>
        </div>
    </div>
    
    <div id="pop_footer">
        <input type="image" id="btnReport" src="https://ssl.pstatic.net/static/common/popup/btn_report2.gif" alt="�Ű��ϱ�" title="�Ű��ϱ�" onMouseOver="this.src='https://ssl.pstatic.net/static/common/popup/btn_report2_over.gif'" onMouseOut="this.src='https://ssl.pstatic.net/static/common/popup/btn_report2.gif'" onclick="return submitForm();">
        <a href="javascript:window.close()"><img src="https://ssl.pstatic.net/static/common/popup/btn_cancel2.gif" width="48" height="28" alt="���" onMouseOver="this.src='https://ssl.pstatic.net/static/common/popup/btn_cancel2_over.gif'" onMouseOut="this.src='https://ssl.pstatic.net/static/common/popup/btn_cancel2.gif'"></a>
    </div>
</div>
</form>

</body>
</html>