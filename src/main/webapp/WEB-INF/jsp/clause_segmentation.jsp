<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: metrovancloud
  Date: 2022/4/7
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Clause Segmentation</title>
    <base  href="<%=basePath%>">
    <link  href="resources/clause_segmentation/clause_segmentation.css" rel="stylesheet" />
    <link  href="resources/clause_segmentation/bootstrap.min.css" rel="stylesheet" />
    <script src="resources/clause_segmentation/clause_segmentation.js"></script>
    <script src="resources/clause_segmentation/jquery.js"></script>
    <script src="resources/clause_segmentation/bootstrap.min.js"></script>
</head>
<body>

<div id="wrapper">
    <div id="annotation_header">
        <span>${sentenceEntity.dataset}</span> > <span>${sentenceEntity.subDataset}</span> > <span>${sentenceEntity.sentenceId}</span>
        <label id="annotator" style="text-decoration: underline;font-style: italic;cursor: hand;" onclick="logout()" annotatorId="${user.userId}">${user.userName}</label>
        <button style="background: #5a8ac9;border: none;border-radius: 5px;color: #fff;margin-left: 15px;" onclick="showAMR()">查看AMR</button>
        <label id="annotatorLabel">当前用户：</label>
    </div>

    <div id='ori_sentence' sentence_id="${sentenceEntity.id}" tree_dict_json='${treeDictJSON}'>
        ${sentenceEntity.sentence}
    </div>

    <div class="annotation_tab">
        <div class="annotationTabSpanList">
            <input type="hidden" id="selectedAnnotatorId" value="${selectedAnnotatorId}">
            <c:forEach items="${annotatorList}" var="annUser">
                <span id="annUserSpan_${annUser.userId}" class="annotationTabSpan" onclick="changeAnnotationTab(this, ${annUser.userId})">${annUser.userName}</span>
            </c:forEach>
        </div>
    </div>

    <div id='textareaList'>
        <c:forEach items="${clauseList}" var="clause" varStatus="status">
            <div class='clauseDiv'>
                <div class="subordinateClauseTypeSpan">
                    <span class="subordinateTypeCN" onclick="openOrdinatorOptionModal(this)">${subordinateTypeCNList.get(status.index)}</span>
                </div>
                <div style="margin-left: ${(clause.level)*50}px;" id="${clause.nodeId}" level='${clause.level}' class="textarea" readonly onclick="clickTextarea(this)" ondblclick="segment()" coordinator="${clause.coordinator}" subordinator="${clause.subordinator}" antecedent="${clause.antecedent}" offset="${clause.offset}" subordinateType="${clause.subordinateType}">
                    ${clause.clause}
                </div>
            </div>
        </c:forEach>
    </div>
    <div id="operation_zone">
        <button style="float: left;margin-left: 50px;" class="btn btn-info" onclick="jump2AnnotationSeq()">跳转到</button>
        <input type="number" id='specifiedAnnotationSeq' value='${sentenceEntity.annotationSeq}' class="text-input">

        <c:if test="${previous eq 0}">
            <button id="previousAnnotationSeq" style="float: left;margin-left: 18%;line-height: 1.5;" class="close" disabled='true' class="btn">&leftarrow;</button>
        </c:if>
        <c:if test="${previous ne 0}">
            <button id="previousAnnotationSeq" style="float: left;margin-left: 18%;line-height: 1.5;" class="close" onclick="changeSentence(${previous})" class="btn">&leftarrow;</button>
        </c:if>

        <button class="btn btn-success" onclick="saveAnnotation()">保存</button>
        <c:if test="${next eq 0}">
            <button id="nextAnnotationSeq" style="margin-right: 45%;line-height: 1.5;" class="close" disabled='true' class="btn">&rightarrow;</button>
        </c:if>
        <c:if test="${next ne 0}">
            <button id="nextAnnotationSeq" style="margin-right: 45%;line-height: 1.5;" class="close" onclick="changeSentence(${next})" class="btn">&rightarrow;</button>
        </c:if>
    </div>
</div>

<div class="modal fade" id="coSubOptionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="max-width:900px;">
        <div class="modal-content">
            <div class="modal-header">
                <button id='modalBack' type="button" class="close" onclick="modalBack()" style="display: none;margin: 0; padding: 0;" aria-hidden="true">&LeftArrow;</button>
                <label style="margin: 0 auto; font-size: 16px;font-weight: bold;">选择从句类型及关键词（引导词、并列词和先行词）</label>
                <button style="margin: 0; padding: 0;" type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <div class="keyword_span">
                     <label class="mainSubLabel">关键词类别：</label>
                     <span class="ordinatorButton subordinatorButtonUnselected" onclick="chooseOrdinator('coSubOptionModal', 1)">引导词</span>
                     <span class="ordinatorButton coordinatorButtonUnSelected" onclick="chooseOrdinator('coSubOptionModal', 2)">并列词</span>
                     <span class="ordinatorButton antecedentButtonUnselected" onclick="chooseOrdinator('coSubOptionModal', 3)">先行词</span>
                </div>

                <div class="main_or_subordinate" style="display: none;">
                    <label class="mainSubLabel">被依赖子句：</label>
                    <span class="MOS_button" onclick="chooseMain(this)" clauseId="1">Clause 1</span>
                    <span class="MOS_button" onclick="chooseMain(this)" clauseId="2">Clause 2</span>
                </div>
                <div id="coSubOptionModalBody"></div>
            </div>
            <div class="modal-footer" style="margin: 0 auto;width: 100%;">
                <p id="clause_combination_type_selection" class="clause_type_selection">
                    <button style="margin-right: 20px;" type="button" onclick="selectCoordinate()" class="btn btn-success">并列句</button>
                    <button type="button" onclick="selectSubordinate()" class="btn btn-primary">主从句</button>
                </p>

                <p style="display: none;" id="coordinate_clause_combination_type_selection" class="clause_type_selection">
                    <button type="button" onclick="confirmCoordinate('')" class="btn btn-success">直接并列</button>
                    <button type="button" onclick="confirmCoordinate('and')" class="btn btn-success">新建AND</button>
                    <button type="button" onclick="confirmCoordinate('or')" class="btn btn-success">新建OR</button>
                    <button type="button" onclick="confirmCoordinate('but')" class="btn btn-success">新建BUT</button>
                </p>
                <p style="display: none;" id="subordinate_clause_combination_type_selection" class="clause_type_selection">
                    <button type="button" onclick="selectSubordinateType('subjective')" class="btn btn-primary">主语从句</button>
                    <button type="button" onclick="selectSubordinateType('objective')" class="btn btn-primary">宾语从句</button>
                    <button type="button" onclick="selectSubordinateType('predicative')" class="btn btn-primary">表语从句</button>
                    <button type="button" onclick="selectSubordinateType('appositive')" class="btn btn-primary">同位语从句</button>
                    <button type="button" onclick="selectSubordinateType('relative')" class="btn btn-primary">关系从句</button>
                    <button type="button" onclick="selectSubordinateType('adverbial')" class="btn btn-primary">状语从句</button>
                </p>
                <p style="display: none;" id="adverbial_clause_type_selection" class="clause_type_selection">
                    <button type="button" onclick="selectAdverbialType('adv.time')" class="btn btn-primary">时间状语</button>
                    <button type="button" onclick="selectAdverbialType('adv.place')" class="btn btn-primary">地点状语</button>
                    <button type="button" onclick="selectAdverbialType('adv.condition')" class="btn btn-primary">条件状语</button>
                    <button type="button" onclick="selectAdverbialType('adv.concession')" class="btn btn-primary">让步状语</button>
                    <button type="button" onclick="selectAdverbialType('adv.reason')" class="btn btn-primary">原因状语</button>
                    <button type="button" onclick="selectAdverbialType('adv.purpose')" class="btn btn-primary">目的状语</button>
                    <button type="button" onclick="selectAdverbialType('adv.result')" class="btn btn-primary">结果状语</button>
                    <button type="button" onclick="selectAdverbialType('adv.manner')" class="btn btn-primary">方式状语</button>
                    <button type="button" onclick="selectAdverbialType('adv.comparation')" class="btn btn-primary">比较状语</button>
                </p>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="ordinatorOptionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="max-width:900px;">
        <div class="modal-content">
            <div class="modal-header">
                <label style="margin: 0 auto; font-size: 16px;font-weight: bold;">选择关键词（引导词、并列词和先行词）</label>
                <button style="margin: 0; padding: 0;" type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <div class="keyword_span">
                    <label class="mainSubLabel">关键词：</label>
                    <span class="ordinatorButton subordinatorButtonUnselected" onclick="chooseOrdinator('ordinatorOptionModal', 1)">
                        引导词
                    </span>
                    <span class="ordinatorButton coordinatorButtonUnSelected" onclick="chooseOrdinator('ordinatorOptionModal', 2)">
                        并列词
                    </span>
                    <span class="ordinatorButton antecedentButtonUnselected" onclick="chooseOrdinator('ordinatorOptionModal', 3)">
                        先行词
                    </span>
                </div>
                <div id="singleClause"></div>
            </div>
            <div class="modal-footer" style="margin: 0 auto;width: 100%;">
                <p class="clause_type_selection">
                    <button style="margin-right: 20px;" type="button" onclick="confirmOrdinator(1)" class="btn btn-info">确认</button>
                    <button type="button" onclick="confirmOrdinator(0)" class="btn btn-default">取消</button>
                </p>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="AMRModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="max-width:900px;">
        <div class="modal-content">
            <div class="modal-header">
                <label style="margin: 0 auto; font-size: 16px;font-weight: bold;">查看句子的AMR</label>
                <button style="margin: 0; padding: 0;" type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <p>${sentenceEntity.sentence}</p>
                <textarea style="width: 100%;height: 500px;" disabled>${sentenceEntity.amr}</textarea>
            </div>
            <div class="modal-footer" style="margin: 0 auto;width: 100%;"></div>
        </div>
    </div>
</div>

</body>

<script>
    $(document).ready(function () {
        adjustSubordinateTypeSpanHeight()
        let treeDictJSON = $('#ori_sentence').attr('tree_dict_json')
        treeDict = JSON.parse(treeDictJSON)

        let selectedAnnotatorId = $('#selectedAnnotatorId').attr('value')
        $('#annUserSpan_'+selectedAnnotatorId).attr('class', 'annotationTabSpan annotationTabSpanSelected')
    })
    document.onkeydown=function(event){
        let e = event || window.event || arguments.callee.caller.arguments[0];
        if(e && e.keyCode == 37 && document.activeElement.id !== 'specifiedAnnotationSeq'){ // 按 Left
            document.getElementById('previousAnnotationSeq').click()
        }
        if(e && e.keyCode == 39 && document.activeElement.id !== 'specifiedAnnotationSeq'){ // 按 Right
            document.getElementById('nextAnnotationSeq').click()
        }
        if(e && e.keyCode == 13){ // 按 Enter
            if (document.activeElement.id === 'specifiedAnnotationSeq') {
                jump2AnnotationSeq()
            } else {
                saveAnnotation()
            }
        }
        if(e && e.keyCode == 65){ // 按 A
            showAMR()
        }
        if(e && e.keyCode == 67){ // 按 C
            let text = $('#ori_sentence').text().trim()
            let textarea = document.createElement("textarea");
            let currentFocus = document.activeElement;
            document.body.appendChild(textarea);
            textarea.value = text;
            textarea.focus();
            if (textarea.setSelectionRange) {
                textarea.setSelectionRange(0, textarea.value.length);
            } else {
                textarea.select();
            }
            let state;
            try {
                state = document.execCommand("copy");
            } catch (err) {
                state = false;
            }
            document.body.removeChild(textarea);
            currentFocus.focus();
            return state;
        }
    };

</script>

</html>
