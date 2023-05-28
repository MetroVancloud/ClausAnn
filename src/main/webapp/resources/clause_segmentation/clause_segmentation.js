// 全局变量
let clause1 = ''
let clause2 = ''

// 当前选中的textarea 的id
let currentSelectedTextarea = null

let oriSentence = ''

// 先前点击的textarea 的id
let previousClickTextarea = null

// 树状结构的level-maxIndex字典
let treeDict = {}

let nominative_clause_type = new Set(['subjective', 'objective', 'predicative', 'appositive'])

/**
 * 双击textarea，进行划分
 * @returns {boolean}
 */
function segment() {
    $('.main_or_subordinate').css('display', 'none')
    $('#modalBack').css('display', 'none')
    $('#clause_combination_type_selection').css('display', 'block')
    $('#subordinate_clause_combination_type_selection').css('display', 'none')
    $('#coordinate_clause_combination_type_selection').css('display', 'none')
    $('#adverbial_clause_type_selection').css('display', 'none')

    $('.MOS_button').attr('class', 'MOS_button')
    clause1 = ''
    clause2 = ''
    // 设置最后光标对象
    let selection = getSelection()
    let selectionIndex = selection.getRangeAt(0)
    let selectedObj = selectionIndex.commonAncestorContainer

    let segmentationIndex;
    let inputVal
    let previousSibling, nextSibling

    if (selectedObj.parentNode.nodeName === 'FONT' || selectedObj.parentNode.nodeName === 'SPAN') {
        previousSibling = selectedObj.parentNode.previousSibling
        nextSibling = selectedObj.parentNode
        currentSelectedTextarea = selectedObj.parentNode.parentNode
    } else {
        previousSibling = selectedObj.previousSibling
        nextSibling = selectedObj.nextSibling
        currentSelectedTextarea = selectedObj.parentNode
        segmentationIndex = selectionIndex.startOffset
        clause1 = selectedObj.nodeValue.substring(0, segmentationIndex)
        clause2 = selectedObj.nodeValue.substring(segmentationIndex)
    }

    while (previousSibling !== null) {
        clause1 = clause1.trim()
        if (previousSibling.nodeType === 3) {
            clause1 = previousSibling.wholeText.trim() + ' ' + clause1
        } else {
            clause1 = previousSibling.outerHTML.trim() + ' ' + clause1
        }
        previousSibling = previousSibling.previousSibling
    }
    clause1 = clause1.trim()
    if (clause1 === '') {
        return false
    }
    while (nextSibling !== null) {
        clause2 = clause2.trim()
        if (nextSibling.nodeType === 3) {
            clause2 = clause2 + ' ' + nextSibling.wholeText.trim()
        } else {
            clause2 = clause2 + ' ' + nextSibling.outerHTML.trim()
        }
        nextSibling = nextSibling.nextSibling
    }

    inputVal = currentSelectedTextarea.innerText
    let clause1Text = replaceFont(clause1)
    let clause2Text = replaceFont(clause2)

    let coordinatorIndexesStr = $(currentSelectedTextarea).attr('coordinator')
    let subordinatorIndexesStr = $(currentSelectedTextarea).attr('subordinator')
    let antecedentIndexesStr = $(currentSelectedTextarea).attr('antecedent')
    let coordinatorIndexArr, subordinatorIndexArr, antecedentIndexArr
    if (coordinatorIndexesStr === '') {
        coordinatorIndexArr = []
    } else {
        coordinatorIndexArr = coordinatorIndexesStr.split(' ')
    }
    if (subordinatorIndexesStr === '') {
        subordinatorIndexArr = []
    } else {
        subordinatorIndexArr = subordinatorIndexesStr.split(' ')
    }
    if (antecedentIndexesStr === '') {
        antecedentIndexArr = []
    } else {
        antecedentIndexArr = antecedentIndexesStr.split(' ')
    }
    let coordinatorIndexSet = new Set(coordinatorIndexArr)
    let subordinatorIndexSet = new Set(subordinatorIndexArr)
    let antecedentIndexSet = new Set(antecedentIndexArr)
    let clause1TokenCount = clause1Text.split(/\s+/).length

    $("#coSubOptionModalBody").html("" +
        "<p style='float: left; width: 100%;'><b>Clause1: </b></p><p id='clause1_span_list' style='float: left;'>" + setTokenSpanForChoose(clause1Text, coordinatorIndexSet, subordinatorIndexSet, 0, 'coSubOptionModal', antecedentIndexSet) +"</p>" +
        "<p style='float: left; width: 100%;'><b>Clause2: </b></p><p id='clause2_span_list' style='float: left;'>" + setTokenSpanForChoose(clause2Text, coordinatorIndexSet, subordinatorIndexSet, clause1TokenCount, 'coSubOptionModal', antecedentIndexSet) +"</p>")
    $("#coSubOptionModal").modal('toggle')
    highlightTokens(inputVal.trim())
    $(currentSelectedTextarea).css('border', '1px solid #007bff')
    clause1 = clause1.trim()
    clause2 = clause2.trim()
    chooseOrdinator('coSubOptionModal', 1)
}

/**
 * 设置modal中token的样式
 * @param clause
 * @param coordinatorIndexes
 * @param subordinatorIndexes
 * @param offset
 * @param modalId
 * @param antecedentIndexes
 * @returns {string}
 */
function setTokenSpanForChoose(clause, coordinatorIndexes, subordinatorIndexes, offset, modalId, antecedentIndexes) {
    clause = replaceSpan(clause)
    let clause_token_list = clause.split(' ')
    let clause_span_list = ''

    for (let i=0; i < clause_token_list.length; i++) {
        let token = clause_token_list[i].trim()
        if (token === '') {
            continue
        }
        if (token === ',' || token === ';' || token === '.' || token === '!' || token === '?') {
            clause_span_list += "<span class='punctuation'>" + token + "</span>"
            offset += 1
        } else if (token === '$NC*'){
            clause_span_list += "<span class='clause_span'>" + token + "</span>"
        } else {
            if (coordinatorIndexes.has(offset+"")) {
                clause_span_list += "<span class='clause_token selected_coordinator' onclick=\"selectTheToken('"+modalId+"', this)\">" + token + "</span>"
            } else if (subordinatorIndexes.has(offset+"")) {
                clause_span_list += "<span class='clause_token selected_subordinator' onclick=\"selectTheToken('"+modalId+"', this)\">" + token + "</span>"
            } else if (antecedentIndexes.has(offset+"")) {
                clause_span_list += "<span class='clause_token selected_antecedent' onclick=\"selectTheToken('"+modalId+"', this)\">" + token + "</span>"
            } else {
                clause_span_list += "<span class='clause_token' onclick=\"selectTheToken('"+modalId+"', this)\">" + token + "</span>"
            }
            offset += 1
        }
    }
    return clause_span_list
}

/**
 * 选中或取消选中当前token作为连接词
 * @param obj
 */
function selectTheToken(modalId, obj) {
    let thisTokenClass = $(obj).attr('class')
    if (thisTokenClass !== "clause_token") {
        $(obj).attr('class', 'clause_token')
    } else {
        let selectedTokenClass = ''
        $('#'+modalId).find('.ordinatorButton').each(function(){
            let className = $(this).attr('class')
            if (className.indexOf('Selected') !== -1 && className.indexOf('subordinator') !== -1)  {
                selectedTokenClass = 'selected_subordinator'
            } else if (className.indexOf('Selected') !== -1 && className.indexOf('coordinator') !== -1) {
                selectedTokenClass = 'selected_coordinator'
            } else if (className.indexOf('Selected') !== -1 && className.indexOf('antecedent') !== -1) {
                selectedTokenClass = 'selected_antecedent'
            }
        })
        $(obj).attr('class', 'clause_token ' + selectedTokenClass)
    }
}

/**
 * 确定为“主从句”
 **/
function selectSubordinate() {
    $('.main_or_subordinate').css('display', 'block')
    $("#clause_combination_type_selection").css('display', 'none')
    $('#subordinate_clause_combination_type_selection').css('display', 'block')
    $('#modalBack').css('display', 'block')
}

function modalBack() {
    if ($('#subordinate_clause_combination_type_selection').css('display') === 'block') {
        $('#subordinate_clause_combination_type_selection').css('display', 'none')
        $('#clause_combination_type_selection').css('display', 'block')
        $('#modalBack').css('display', 'none')
        $('#main_or_subordinate').css('display', 'block')
        $('#adverbial_clause_type_selection').css('display', 'none')
        $('#coordinate_clause_combination_type_selection').css('display', 'none')
    } else if ($('#adverbial_clause_type_selection').css('display') === 'block') {
        $('#subordinate_clause_combination_type_selection').css('display', 'block')
        $('#adverbial_clause_type_selection').css('display', 'none')
        $('#clause_combination_type_selection').css('display', 'none')
        $('#main_or_subordinate').css('display', 'block')
        $('#coordinate_clause_combination_type_selection').css('display', 'none')
    } else if ($('#coordinate_clause_combination_type_selection').css('display') === 'block') {
        $('#subordinate_clause_combination_type_selection').css('display', 'none')
        $('#coordinate_clause_combination_type_selection').css('display', 'none')
        $('#adverbial_clause_type_selection').css('display', 'none')
        $('#clause_combination_type_selection').css('display', 'block')
        $('#main_or_subordinate').css('display', 'none')
        $('#modalBack').css('display', 'none')
    }
}

/**
 * 选择主从句的类型
 * @param subordinateType
 */
function selectSubordinateType(subordinateType) {
    if (subordinateType === 'adverbial') {
        $('#subordinate_clause_combination_type_selection').css('display', 'none')
        $('#adverbial_clause_type_selection').css('display', 'block')
    } else {
        buildMainAndSubordinateClause(subordinateType)
    }
}

function selectAdverbialType(adverbialType) {
    buildMainAndSubordinateClause(adverbialType)
}

function buildMainAndSubordinateClause(subordinateType) {

    //  是否选择主句
    let mainClauseId = 0
    $('.MOS_button').each(function (){
        if ($(this).attr('class') === 'MOS_button MOS_buttonSelected') {
            mainClauseId = $(this).attr('clauseId')
        }
    })
    if (mainClauseId === 0) {
        alert('请选择Clause 1或Clause 2为被依赖的子句')
        return;
    }

    let splitBefore = replaceFont(replaceSpan($(currentSelectedTextarea).html().trim())).replace(/\s+/g, ' ')

    let currentSelectedTextareaWidth = $(currentSelectedTextarea).css('width')
    let currentSelectedTextareaMargin = $(currentSelectedTextarea).css('margin-left')
    let currentSelectedTextareaLevel = parseInt($(currentSelectedTextarea).attr('level'))
    let currentSelectedTextareaId = $(currentSelectedTextarea).attr('id')

    let subordinateClauseWidth = parseInt(currentSelectedTextareaWidth.substring(0,
        currentSelectedTextareaWidth.length-2)) - 1000 * 0.05
    let subordinateClauseMargin = parseInt(currentSelectedTextareaMargin.substring(0,
        currentSelectedTextareaMargin.length-2)) + 1000 * 0.05

    let spanList1, spanList2
    if (mainClauseId === '2') {
        let tempClause = clause2
        clause2 = clause1
        clause1 = tempClause
        spanList1 = $("#clause2_span_list").children()
        spanList2 = $("#clause1_span_list").children()
    } else {
        spanList1 = $("#clause1_span_list").children()
        spanList2 = $("#clause2_span_list").children()
    }

    $(currentSelectedTextarea).html(clause1.trim())
    let closestSubClause = findClosestClauseForSubClause(currentSelectedTextarea, clause2)

    let subTextareaLevel = currentSelectedTextareaLevel + 1
    let subTextareaLevelIndex = 1
    let treeDictKeys = Object.keys(treeDict)
    let treeDictKeySet = new Set(treeDictKeys)
    if (treeDictKeySet.has(subTextareaLevel+"")) {
        subTextareaLevelIndex = treeDict[subTextareaLevel] + 1
    }
    treeDict[subTextareaLevel] = subTextareaLevelIndex
    let subTextareaId = currentSelectedTextareaId + '-' + subTextareaLevelIndex

    $(closestSubClause).parent().after("<div class='clauseDiv'><div class='subordinateClauseTypeSpan'><span class='subordinateTypeCN' onclick='openOrdinatorOptionModal(this)' openOrdinatorOptionModal>"+subordinateType2Chinese(subordinateType)+"</span></div><div class='textarea' onclick='clickTextarea(this)' id='"+subTextareaId+"' " +
        "level='"+subTextareaLevel+"' readonly style='margin-left: "+subordinateClauseMargin+"px;" +
        "width: "+ subordinateClauseWidth +"px' ondblclick='segment()' coordinator='' subordinator='' antecedent=''>"+clause2.trim() +"</div></div>")

    let newSubClause = $('#'+subTextareaId)

    let coSubOrdinatorIndexes1 = getSelectedCoSubOrdinator(spanList1)
    let coSubOrdinatorIndexes2 = getSelectedCoSubOrdinator(spanList2)

    rebuildClause(currentSelectedTextarea, clause1, coSubOrdinatorIndexes1[0], coSubOrdinatorIndexes1[1], coSubOrdinatorIndexes1[2])
    rebuildClause(newSubClause[0], clause2, coSubOrdinatorIndexes2[0], coSubOrdinatorIndexes2[1], coSubOrdinatorIndexes2[2])

    if (nominative_clause_type.has(subordinateType)) {
        let html = $(currentSelectedTextarea).html()
        let offset = replaceSpan(replaceFont(html)).split(' ').length
        $('#'+subTextareaId).attr('offset', offset+'')
        if (subordinateType !== 'subjective') {
            $(currentSelectedTextarea).html(html + ' <span class="N_CLAU" mapped_clause="'+ subTextareaId +'" style="font-weight: bold;color: red;">$NC*</span> ' )
        } else {
            let clause2Text = replaceFont(replaceSpan(clause2.trim())).replace(/\s+/g, ' ')
            if (splitBefore.indexOf(clause2Text) === 0) {
                $(currentSelectedTextarea).html('<span class="N_CLAU" mapped_clause="' + subTextareaId + '" style="font-weight: bold;color: red;">$NC*</span> ' + html)
            }
        }
    }

    $(currentSelectedTextarea).attr('coordinator', coSubOrdinatorIndexes1[0])
    $(currentSelectedTextarea).attr('subordinator', coSubOrdinatorIndexes1[1])
    $(currentSelectedTextarea).attr('antecedent', coSubOrdinatorIndexes1[2])

    $('#'+subTextareaId).attr('coordinator', coSubOrdinatorIndexes2[0])
    $('#'+subTextareaId).attr('subordinator', coSubOrdinatorIndexes2[1])
    $('#'+subTextareaId).attr('antecedent', coSubOrdinatorIndexes2[2])
    $('#'+subTextareaId).attr('subordinateType', subordinateType)

    if (previousClickTextarea === currentSelectedTextarea) {
        previousClickTextarea = null
    }

    restituteModal()
    $("#coSubOptionModal").modal('toggle')
    removeHighlight()
    adjustSubordinateTypeSpanHeight()
}

function selectCoordinate() {
    $('.main_or_subordinate').css('display', 'none')
    $("#clause_combination_type_selection").css('display', 'none')
    $('#subordinate_clause_combination_type_selection').css('display', 'none')
    $('#coordinate_clause_combination_type_selection').css('display', 'block')
    $('#modalBack').css('display', 'block')
}

/**
 * 确定为“并列句”
 **/
function confirmCoordinate(coordinateType) {
    let currentSelectedTextareaLevel = parseInt($(currentSelectedTextarea).attr('level'))
    let currentSelectedTextareaId = $(currentSelectedTextarea).attr('id')
    let siblingTextareaIndex
    let spanList1 = $("#clause1_span_list").children()
    let spanList2 = $("#clause2_span_list").children()
    let coSubOrdinatorIndexes1 = getSelectedCoSubOrdinator(spanList1)
    let coSubOrdinatorIndexes2 = getSelectedCoSubOrdinator(spanList2)

    if (coordinateType !== '') {
        $(currentSelectedTextarea).html(coordinateType.toUpperCase())
        $(currentSelectedTextarea).attr('coordinator', '')
        $(currentSelectedTextarea).attr('subordinator', '')

        let currentSelectedTextareaMargin = $(currentSelectedTextarea).css('margin-left')
        let currentSelectedTextareaWidth = $(currentSelectedTextarea).css('width')
        let siblingTextareaIndex1 = 1
        if (currentSelectedTextareaLevel+1 in Object.keys(treeDict)) {
            siblingTextareaIndex1 = treeDict[currentSelectedTextareaLevel+1] + 1
        }
        let siblingTextareaIndex2 = siblingTextareaIndex1 + 1
        treeDict[currentSelectedTextareaLevel+1] = siblingTextareaIndex2

        let siblingTextareaId1 = currentSelectedTextareaId + '-' + siblingTextareaIndex1
        let siblingTextareaId2 = currentSelectedTextareaId + '-' + siblingTextareaIndex2
        let clauseMargin = parseInt(currentSelectedTextareaMargin.substring(0,
            currentSelectedTextareaMargin.length-2)) + 1000 * 0.05
        let clauseWidth = parseInt(currentSelectedTextareaWidth.substring(0,
            currentSelectedTextareaWidth.length-2)) - 1000 * 0.05

        $(currentSelectedTextarea).parent().after(
            "<div class='clauseDiv'>" +
                "<div class='subordinateClauseTypeSpan'>" +
                    "<span class='subordinateTypeCN' onclick='openOrdinatorOptionModal(this)' openOrdinatorOptionModal>OP</span>" +
                "</div>" +
                "<div class='textarea' onclick='clickTextarea(this)' id='"+siblingTextareaId2+"' " + "level='"+(currentSelectedTextareaLevel+1)+"' readonly style='margin-left: "+clauseMargin+"px;" + "width: "+ clauseWidth +"px' ondblclick='segment()' coordinator='' subordinator='' antecedent='' subordinateType='op'>"+clause2.trim() +"" +
                "</div>" +
            "</div>")
        $(currentSelectedTextarea).parent().after(
            "<div class='clauseDiv'>" +
                "<div class='subordinateClauseTypeSpan'>" +
                    "<span class='subordinateTypeCN' onclick='openOrdinatorOptionModal(this)' openOrdinatorOptionModal>OP</span>" +
                "</div>" +
                "<div class='textarea' onclick='clickTextarea(this)' id='"+siblingTextareaId1+"' " + "level='"+(currentSelectedTextareaLevel+1)+"' readonly style='margin-left: "+clauseMargin+"px;" + "width: "+ clauseWidth +"px' ondblclick='segment()' coordinator='' subordinator='' antecedent='' subordinateType='op'>"+clause1.trim() +"" +
                "</div>" +
            "</div>")

        rebuildClause($("#"+siblingTextareaId1)[0], clause1, coSubOrdinatorIndexes1[0], coSubOrdinatorIndexes1[1], coSubOrdinatorIndexes1[2])
        rebuildClause($("#"+siblingTextareaId2)[0], clause2, coSubOrdinatorIndexes2[0], coSubOrdinatorIndexes2[1], coSubOrdinatorIndexes2[2])

    } else {
        $(currentSelectedTextarea).html(clause1.trim())
        let closestCoClause = findClosestClauseForCoClause(currentSelectedTextarea, clause2)
        siblingTextareaIndex = treeDict[currentSelectedTextareaLevel] + 1
        let siblingTextareaId = siblingTextareaIndex
        let lastDashIndex = currentSelectedTextareaId.lastIndexOf('-')
        if (lastDashIndex !== -1) {
            siblingTextareaId = currentSelectedTextareaId.substring(0, lastDashIndex+1) + siblingTextareaIndex
        }
        treeDict[currentSelectedTextareaLevel] = siblingTextareaIndex
        let newCoClause = $(currentSelectedTextarea).parent().clone(true)
        $(newCoClause).find('.textarea').each(function (){
            $(this).attr('id', siblingTextareaId)
            $(this).attr('level', currentSelectedTextareaLevel)
            $(this).html(clause2)
        })
        $(closestCoClause).parent().after($(newCoClause))

        rebuildClause(currentSelectedTextarea, clause1, coSubOrdinatorIndexes1[0], coSubOrdinatorIndexes1[1], coSubOrdinatorIndexes1[2])
        rebuildClause($("#"+siblingTextareaId)[0], clause2, coSubOrdinatorIndexes2[0], coSubOrdinatorIndexes2[1], coSubOrdinatorIndexes2[2])
    }

    if (previousClickTextarea === currentSelectedTextarea) {
        previousClickTextarea = null
    }

    $("#coSubOptionModal").modal('toggle')
    removeHighlight()
    adjustSubordinateTypeSpanHeight()
}

/**
 * 单击textarea
 * @param obj
 */
function clickTextarea(obj) {
    if (oriSentence === '') {
        oriSentence = $("#ori_sentence").text().trim()
    }
    if (previousClickTextarea === null) {
        previousClickTextarea = obj
        highlightTokens(obj.innerText.trim())
        $(obj).css('border', '1px solid #007bff')
    } else if (previousClickTextarea === obj) {
        $(previousClickTextarea).css('border', '')
        previousClickTextarea = null
        removeHighlight()
    } else {
        let previousClickTextareaId = $(previousClickTextarea).attr('id')
        let currentClickTextareaId = $(obj).attr('id')

        let remained = null
        let discarded = null
        if (previousClickTextareaId.indexOf(currentClickTextareaId) === 0) {
            remained = obj
            discarded = previousClickTextarea
        } else if (currentClickTextareaId.indexOf(previousClickTextareaId) === 0) {
            remained = previousClickTextarea
            discarded = obj
        } else {
            let previousLastDashIndex = previousClickTextareaId.lastIndexOf('-')
            let currentLastDashIndex = currentClickTextareaId.lastIndexOf('-')

            let previousSeq = 0
            let currentSeq = 0;
            if (previousLastDashIndex === -1 && currentLastDashIndex === -1) {
                previousSeq = parseInt(previousClickTextareaId)
                currentSeq = parseInt(currentClickTextareaId)
            }
            if (previousLastDashIndex !== -1 && currentLastDashIndex !== -1
                && previousClickTextareaId.substring(0, previousLastDashIndex)
                === currentClickTextareaId.substring(0, currentLastDashIndex)) {
                previousSeq = parseInt(previousClickTextareaId.substring(previousLastDashIndex + 1, previousClickTextareaId.length))
                currentSeq = parseInt(currentClickTextareaId.substring(currentLastDashIndex + 1, currentLastDashIndex.length))
            }
            if (previousSeq !== 0 && currentSeq !== 0) {
                let previousClickText = $(previousClickTextarea).html().trim()
                let currentClickText = $(obj).html().trim()
                if (oriSentence.indexOf(previousClickText) > oriSentence.indexOf(currentClickText)) {
                    remained = obj
                    discarded = previousClickTextarea
                } else {
                    remained = previousClickTextarea
                    discarded = obj
                }
            }
        }

        //  被合并的子句若为名词性从句，则不允许被合并进入非主句中
        let discardedId = $(discarded).attr('id')

        //  必须是“祖先-子孙”关系，或者互为sibling才能合并
        if (remained !== null && discarded !== null) {

            let coordinationNewNode = null
            let coordinationNewNodeValueSet = new Set(['AND','OR','BUT'])

            //  首先查看discarded是否为 AND BUT OR，如果是，不予合并
            //  其次查看，remained 是否是 AND BUT OR，如果是，且其子节点有且仅有discarded，则可以合并
            if (coordinationNewNodeValueSet.has($(remained).text().trim())) {
                coordinationNewNode = remained
            } else if (coordinationNewNodeValueSet.has($(discarded).text().trim())) {
                coordinationNewNode = discarded
            }
            if (null !== coordinationNewNode) {
                let coordinationNewNodeId = $(coordinationNewNode).attr('id')
                let childrenOfCoordinationNewNode = []
                let coordinationNewNodeLevel = parseInt($(coordinationNewNode).attr('level'))
                $('.textarea').each(function (){
                    let thisLevel = parseInt($(this).attr('level'))
                    let thisId = $(this).attr('id')
                    if (thisLevel === coordinationNewNodeLevel+1 && thisId.startsWith(coordinationNewNodeId+'-')) {
                        childrenOfCoordinationNewNode.push(this)
                    }
                })
                //  新建的并列节点，没有子节点，该节点没用了，直接删除
                if (childrenOfCoordinationNewNode.length == 0) {
                    $(coordinationNewNode).parent().remove()
                    if (coordinationNewNode !== obj) {
                        previousClickTextarea = obj
                        highlightTokens($(obj).text())
                        $(obj).css('border', '1px solid #007bff')
                    }
                    return;
                } else {
                    if (coordinationNewNode === discarded) {
                        //还有子节点不能合并
                        $(previousClickTextarea).css('border', '')
                        previousClickTextarea = obj
                        highlightTokens($(obj).text())
                        $(obj).css('border', '1px solid #007bff')
                        return
                    } else {
                        //合并其子节点，必须保证仅有一个子节点，且为discarded
                        if (childrenOfCoordinationNewNode.length == 1 && childrenOfCoordinationNewNode[0] === discarded) {
                            remained.innerHTML = discarded.innerHTML
                            $(remained).attr('coordinator', $(discarded).attr('coordinator'))
                            $(remained).attr('subordinator', $(discarded).attr('subordinator'))
                            $(remained).attr('antecedent', $(discarded).attr('antecedent'))
                            $(discarded).parent().remove()
                            // previousClickTextarea = remained
                            previousClickTextarea = null
                            highlightTokens($(remained).text())
                            //$(remained).css('border', '1px solid #007bff')
                            adjustSubordinateTypeSpanHeight()
                            return
                        } else {
                            $(previousClickTextarea).css('border', '')
                            previousClickTextarea = obj
                            highlightTokens($(obj).text())
                            $(obj).css('border', '1px solid #007bff')
                            return
                        }
                    }
                }
            }

            //  合并时需检查discarded在remained中是否有标签
            let combined = false    //是否在 N_Clause 检查中已经合并
            $(remained).find('.N_CLAU').each(function(){
                let mapped_clause = $(this).attr('mapped_clause')
                if (mapped_clause === discardedId) {
                    let remainedHtml = $(remained).html().trim()
                    let discardedHtml = $(discarded).html().trim()
                    remainedHtml = replaceClauseSpan(remainedHtml, discardedId, discardedHtml)
                    $(remained).html(remainedHtml)
                    combined = true
                }
            })

            let existMapping = false
            $('#textareaList').find('.N_CLAU').each(function (){
                if ($(this).attr('mapped_clause') === discardedId) {
                    existMapping = true
                }
            })

            if (existMapping && !combined){
                $(previousClickTextarea).css('border', '')
                previousClickTextarea = obj
                highlightTokens($(obj).text())
                $(obj).css('border', '1px solid #007bff')
            } else {
                if (!combined) {
                    combineTwoClauseAtRightPosition(remained, discarded)
                }
                $(discarded).parent().remove()
                //previousClickTextarea = remained
                //highlightTokens($(remained).text())
                // $(remained).css('border', '1px solid #007bff')
                previousClickTextarea = null
                resetKeywordIndexesInClause(remained)
            }
        } else {
            $(previousClickTextarea).css('border', '')
            previousClickTextarea = obj
            highlightTokens($(obj).text())
            $(obj).css('border', '1px solid #007bff')
        }
        adjustSubordinateTypeSpanHeight()
    }
}

function combineTwoClauseAtRightPosition(remained, discarded) {
    let remainedHtml = '', discardedText = ''
    let discardedCpy = discarded.cloneNode(true)
    let discardedChildElems = discarded.childNodes
    for (let i=0; i<discardedChildElems.length; i++) {
        if (discardedChildElems[i].nodeName === 'SPAN') {
            let mapped_clause = $(discardedCpy.childNodes[i]).attr('mapped_clause')
            discardedText += ' ' + $('#'+mapped_clause).text().trim()
        } else if (discardedChildElems[i].nodeName === 'FONT') {
            discardedText += ' ' + discardedChildElems[i].innerHTML.trim()
        } else {
            discardedText += ' ' + discardedChildElems[i].textContent.trim()
        }
    }
    discardedText = discardedText.trim()
    discardedText = discardedText.replace(/\s+/g, ' ').trim()

    let remainedChildElems = remained.childNodes
    let startMatched = false, endMatched = false
    for (let i=0; i<remainedChildElems.length; i++) {
        if (remainedChildElems[i].nodeName === 'FONT') {
            let currentToken = remainedChildElems[i].innerText
            let res = buildRemainedHTML(currentToken, remainedHtml, discardedText, discarded.innerHTML, startMatched, endMatched)
            remainedHtml = res.remainedHtml
            startMatched = res.startMatched
            endMatched = res.endMatched
            remainedHtml += ' ' + remainedChildElems[i].outerHTML.trim() + ' '
        } else if (remainedChildElems[i].nodeName === 'SPAN') {
            let mapped_clause = $(remainedChildElems[i]).attr('mapped_clause')
            let currentTokens = $('#' + mapped_clause).text().trim()
            let res = buildRemainedHTML(currentTokens, remainedHtml, discardedText, discarded.innerHTML, startMatched, endMatched)
            remainedHtml = res.remainedHtml
            startMatched = res.startMatched
            endMatched = res.endMatched
            remainedHtml += ' ' + remainedChildElems[i].outerHTML.trim() + ' '
        } else {
            let currentTokens = remainedChildElems[i].textContent.trim()
            if (currentTokens === '') {
                continue
            }
            let currentTokenList = currentTokens.split(/\s+/)
            for (let j=0; j< currentTokenList.length; j++) {
                let currentToken = currentTokenList[j]
                let res = buildRemainedHTML(currentToken, remainedHtml, discardedText, discarded.innerHTML, startMatched, endMatched)
                remainedHtml = res.remainedHtml
                startMatched = res.startMatched
                endMatched = res.endMatched
                remainedHtml += ' ' + currentToken.trim() + ' '
            }
        }
    }
    if (!endMatched) {
        let remainedText = replaceFont(remainedHtml)
        remainedText = remainedText.replace(/\s+/g, ' ').trim()
        let ori_sentence = $('#ori_sentence').text().replace(/\s+/g, ' ').trim()
        let remainedIndex = ori_sentence.indexOf(remainedText)
        let discardedIndex = ori_sentence.indexOf(discardedText)
        if (remainedIndex != -1 && discardedIndex != -1) {
            if (remainedIndex < discardedIndex) {
                remainedHtml = (remainedHtml + ' ' + discarded.innerHTML).replace(/\s+/g, ' ')
            } else {
                remainedHtml = (discarded.innerHTML + ' ' + remainedHtml).replace(/\s+/g, ' ')
            }
        } else {
            remainedHtml = (remainedHtml + ' ' + discarded.innerHTML).replace(/\s+/g, ' ')
        }
    }
    remained.innerHTML = remainedHtml
}

function buildRemainedHTML(currentToken, remainedHtml, discardedText, discardedHtml, startMatched, endMatched) {
    let oriSentence = $('#ori_sentence').text().trim()
    if (startMatched) {
        if (!endMatched) {
            if (oriSentence.indexOf(discardedText + ' ' + currentToken) !== -1) {
                remainedHtml += discardedHtml.trim()
                endMatched = true
            } else {
                startMatched = false
            }
        }
    } else {
        if (oriSentence.indexOf(currentToken + ' ' + discardedText) !== -1) {
            startMatched = true
        }
    }
    return {remainedHtml: remainedHtml, startMatched: startMatched, endMatched: endMatched}
}

/**
 * 在合并/拆分两个子句时，子句中keyword(coordinator, subordinator, antecedent)的索引
 * @param obj
 */
function resetKeywordIndexesInClause(obj) {
    let childElems = obj.childNodes
    let tokenCount = 0
    let coordinator = '', subordinator = '', antecedent = ''
    for (let i=0; i<childElems.length; i++) {
        if (childElems[i].nodeName !== "SPAN") {
            if (childElems[i].nodeName === "FONT") {
                if (childElems[i].attributes[0].value === "color: #007bff;") {
                    subordinator += tokenCount + ' '
                } else if (childElems[i].attributes[0].value === "color: #28a745;") {
                    coordinator += tokenCount + ' '
                } else {
                    antecedent += tokenCount + ' '
                }
                tokenCount += childElems[i].innerText.trim().split(/\s+/).length
            } else {
                let textContent = childElems[i].textContent.trim()
                if (textContent !== '') {
                    tokenCount += textContent.split(/\s+/).length
                }
            }
        }
    }
    $(obj).attr('coordinator', coordinator.trim())
    $(obj).attr('subordinator', subordinator.trim())
    $(obj).attr('antecedent', antecedent.trim())
}

/**
 *
 * @param offset
 * @param keywordIndexes
 */
function modifyKeywordIndex(offset, keywordIndexes) {
    if (keywordIndexes.trim() !== '') {
        let modifiedKeywordIndexes = ''
        let keywordIndexList = keywordIndexes.split(' ')
        for (let i=0; i < keywordIndexList.length; i++) {
            if (keywordIndexList[i] !==  '') {
                modifiedKeywordIndexes += (parseInt(keywordIndexList[i]) + parseInt(offset)).toString() + ' '
            }
        }
        return modifiedKeywordIndexes.trim()
    } else {
        return ''
    }
}

/**
 * 在原始句子中标亮当前选中的子句
 * @param clause
 */
function highlightTokens(clause) {
    clause = clause.replace('$NC*', '')
    removeHighlight()
    oriSentence = oriSentence.replace(clause, "<font color=\'#007bff\'>"+clause+"</font>")
    //$('#ori_sentence').html(oriSentence)
}

/**
 * 在原始句子中取消所有标亮的子句
 */
function removeHighlight() {
    oriSentence = oriSentence.replace(/<font color=['"]#007bff['"]>/g, '')
    oriSentence = oriSentence.replace(/<\/font>/g, '')
    //$('#ori_sentence').html(oriSentence)
    $(".textarea").each(function (){
        $(this).css('border', '')
    })
}

/**
 * 在做"主从"分割时，找到主子句的从子句中，找到与新增从子句最近的从子句并返回；若当前主子句没有从子句，则返回主子句
 */
function findClosestClauseForSubClause(mainClause, subClauseText) {
    let mainClauseId = $(mainClause).attr("id")
    let closestClause = mainClause
    let subClauseOffset = oriSentence.indexOf(subClauseText)
    let closestOffset = 99999

    $('.textarea').each(function(){
        let thisClauseId = $(this).attr("id")
        let thisClauseText = $(this).html().trim()
        if (thisClauseId.indexOf(mainClauseId) === 0) {
            let thisClauseOffset = oriSentence.indexOf(thisClauseText) + thisClauseText.length
            if (subClauseOffset >= thisClauseOffset && (subClauseOffset - thisClauseOffset) < closestOffset) {
                closestOffset = subClauseOffset - thisClauseOffset
                closestClause = this
            }
        }
    })
    return closestClause
}

/**
 * 在做"并列"分割时，找到当前子句的并列子句中，找到与新增从子句最近的子句并返回；若当前子句没有并列子句，则返回当前子句
 */
function findClosestClauseForCoClause(existedClause, coClauseText) {
    let existedClauseId = $(existedClause).attr("id")
    let existedClauseText = $(existedClause).html().trim()
    let closestClause = existedClause

    let coClauseOffset = oriSentence.indexOf(replaceFont(coClauseText).replace(/\s+/g, ' '))
    let closestOffset = coClauseOffset - (oriSentence.indexOf(replaceFont(existedClauseText).replace(/\s+/g, ' ')) + existedClauseText.length)

    $('.textarea').each(function(){
        let thisClauseId = $(this).attr("id")
        if ((thisClauseId.indexOf("-") === -1 && existedClauseId.indexOf("-") === -1)
            || (thisClauseId.indexOf("-") !== -1 && existedClauseId.indexOf("-") !== -1 && (thisClauseId.substring(0, thisClauseId.lastIndexOf("-")) === existedClauseId.substring(0, existedClauseId.lastIndexOf("-"))))
            || thisClauseId.indexOf(existedClauseId) === 0) {

            let thisClauseText = $(this).html().trim()
            let thisClauseOffset = oriSentence.indexOf(replaceFont(thisClauseText).replace(/\s+/g, ' ')) + thisClauseText.length
            if (coClauseOffset >= thisClauseOffset && (coClauseOffset - thisClauseOffset) < closestOffset) {
                closestOffset = coClauseOffset - thisClauseOffset
                closestClause = this
            }
        }
    })
    return closestClause
}

/**
 * 删除clause中的高亮标签
 * @param str
 * @returns {*}
 */
function replaceFont(str) {
    let replacedStr = str.replace(/<font(.)+?>/g, '')
    replacedStr = replacedStr.replace(/<\/font>/g, '')
    return replacedStr
}

function replaceSpan(str) {
    str = str.replace(/\s*<span(.)+?>/g, ' ')
    str = str.replace(/<\/span>\s*/g, ' ')
    return str
}

function replaceClauseSpan(str, textareaId, str2) {
    let reg = new RegExp("\s*<span(.)*?mapped_clause=[\'\"]"+textareaId+"[\'\"](.)*?>(.)*?</span>\s*");
    return  str.replace(reg, ' ' + str2 + ' ')
}

/**
 * 恢复分句modal的默认样式
 */
function restituteModal() {
    $('#clause_combination_type_selection').css('display', 'block')
    $('#subordinate_clause_combination_type_selection').css('display', 'none')
}

/**
 * 将英文的从句类型转换为中文标签显示
 * @param subordinateType
 * @returns {string}
 */
function subordinateType2Chinese(subordinateType) {
    if (subordinateType === 'subjective') {
        return '主语'
        //return 'Sub.'
    } else if (subordinateType === 'objective') {
        return '宾语'
        //return 'Obj.'
    } else if (subordinateType === 'predicative') {
        return '表语'
        //return 'Pred.'
    } else if (subordinateType === 'appositive') {
        return '同位'
        //return 'Appo.'
    } else if (subordinateType === 'relative') {
        return '关系'
        //return 'Rel.'
    } else if (subordinateType === 'adv.time') {
        return '时间状语'
        //return 'Adv.'
    } else if (subordinateType === 'adv.place') {
        return '地点状语'
        //return 'Adv.'
    } else if (subordinateType === 'adv.condition') {
        return '条件状语'
        //return 'Adv.'
    } else if (subordinateType === 'adv.concession') {
        return '让步状语'
        //return 'Adv.'
    } else if (subordinateType === 'adv.reason') {
        return '原因状语'
        //return 'Adv.'
    } else if (subordinateType === 'adv.purpose') {
        return '目的状语'
        //return 'Adv.'
    } else if (subordinateType === 'adv.result') {
        return '结果状语'
        //return 'Adv.'
    } else if (subordinateType === 'adv.manner') {
        return '方式状语'
        //return 'Adv.'
    } else if (subordinateType === 'adv.comparation') {
        return '比较状语'
        //return 'Adv.'
    } else if (subordinateType === 'op') {
        return 'OP'
        //return 'Adv.'
    } else {
        return ''
    }
}

/**
 * 调整因textarea自适应高度后，对应subClause的类型标签的位置
 */
function adjustSubordinateTypeSpanHeight() {
    $(".subordinateClauseTypeSpan").each(function(){
        let subClauseTypeCN = this.firstElementChild
        let textarea = $(this).next()[0]
        let height = $(textarea).css('height')
        let marginLeft = $(textarea).css('margin-left')
        $(subClauseTypeCN).css('height', height)
        $(subClauseTypeCN).css('line-height', height)
        $(this).css('width', marginLeft)
    })
}

/**
 * 打开单句clause选择连接词的modal
 * @param obj
 */
function openOrdinatorOptionModal(obj) {
    $('#ordinatorOptionModal').modal('toggle')
    let textarea = $(obj).parent().next()[0]
    let clause = textarea.innerHTML.trim()
    let coordinatorIndexes = $(textarea).attr('coordinator')
    let subordinatorIndexes = $(textarea).attr('subordinator')
    let antecedentIndexes = $(textarea).attr('antecedent')
    let clauseText = replaceFont(clause)
    $("#singleClause").attr('textareaIdOfTheClause', $(textarea).attr('id'))
    $("#singleClause").html("<p style='float: left; width: 100%;'><b>Clause: </b></p><p id='clause_span_list' style='float: left;'>" + setTokenSpanForChoose(clauseText, str2Set(coordinatorIndexes), str2Set(subordinatorIndexes), 0, 'ordinatorOptionModal', str2Set(antecedentIndexes)) +"</p>")
    chooseOrdinator('ordinatorOptionModal', 1)
}

/**
 * 选择标注连接词的类型
 * @param ordinatorType
 */
function chooseOrdinator(modalId, ordinatorType) {
    let spanCount = 0
    let subordinatorButton = null
    let coordinatorButton = null
    let antecedentButton = null
    $('#'+modalId).find('.ordinatorButton').each(function (){
        if (spanCount === 0) {
            subordinatorButton = this
        } else if (spanCount === 1) {
            coordinatorButton = this
        } else if (spanCount === 2){
            antecedentButton = this
        }
        spanCount++
    })

    if (ordinatorType === 1) {
        $(subordinatorButton).attr('class', 'ordinatorButton subordinatorButtonSelected')
        $(coordinatorButton).attr('class', 'ordinatorButton coordinatorButtonUnselected')
        $(antecedentButton).attr('class', 'ordinatorButton antecedentButtonUnselected')
    } else if (ordinatorType === 2){
        $(subordinatorButton).attr('class', 'ordinatorButton subordinatorButtonUnSelected')
        $(coordinatorButton).attr('class', 'ordinatorButton coordinatorButtonSelected')
        $(antecedentButton).attr('class', 'ordinatorButton antecedentButtonUnselected')
    } else {
        $(subordinatorButton).attr('class', 'ordinatorButton subordinatorButtonUnSelected')
        $(coordinatorButton).attr('class', 'ordinatorButton coordinatorButtonUnSelected')
        $(antecedentButton).attr('class', 'ordinatorButton antecedentButtonSelected')
    }
}

function chooseCoordinationType() {
    $('.COT_button').each(function (){
        $(this).attr('class', 'COT_button')
    })
    $(obj).attr('class', 'COT_button COT_buttonSelected')
}

/**
 * 将空格分割字符串数组，转换成Set
 * @param str
 * @returns {Set<any>|Set<*>}
 */
function str2Set(str) {
    if (str === '') {
        return new Set([])
    } else {
        let arr = str.split(' ')
        return new Set(arr)
    }
}

/**
 * 确认完成当前clause的连接词选择
 * @param signal
 */
function confirmOrdinator(signal) {
    if (signal === 1) {
        let keywordIndexesList
        let coordinatorIndexes = '', subordinatorIndexes = '', antecedentIndexes = ''
        let spanList = $('#clause_span_list').children()
        keywordIndexesList = getSelectedCoSubOrdinator(spanList)
        coordinatorIndexes = keywordIndexesList[0]
        subordinatorIndexes = keywordIndexesList[1]
        antecedentIndexes = keywordIndexesList[2]
        let mappingTextareaOfTheClause = $('#singleClause').attr('textareaIdOfTheClause')
        $('#'+mappingTextareaOfTheClause).attr('subordinator', subordinatorIndexes)
        $('#'+mappingTextareaOfTheClause).attr('coordinator', coordinatorIndexes)
        $('#'+mappingTextareaOfTheClause).attr('antecedent', antecedentIndexes)
        let clause = $('#'+mappingTextareaOfTheClause).html().trim()
        rebuildClause($('#'+mappingTextareaOfTheClause)[0], clause, coordinatorIndexes, subordinatorIndexes, antecedentIndexes)

        let loginAnnotatorId = parseInt($('#annotator').attr('annotatorId'))
        let annotatorId = -1
        $('.annotationTabSpanSelected').each(function (){
            annotatorId = parseInt($(this).attr('id').substring(12))
        })
        let sentenceId = $('#ori_sentence').attr('sentence_id')
        if (loginAnnotatorId === 1 && annotatorId !== 1 && annotatorId !== -1) {
            $.ajax({
                type: 'POST',
                url: 'clause_segmentation/save_subordinator_of_single_clause.do',
                dataType: 'json',                               //  表示返回值的数据类型
                contentType: 'application/json;charset=UTF-8',  //  内容类型
                traditional: true, //使json格式的字符串不会被转码
                data: JSON.stringify({nodeId: mappingTextareaOfTheClause, sentenceId: sentenceId, subordinator: subordinatorIndexes, annotatorId: annotatorId}),
                success: function (data) {
                    if (data.success) {

                    }
                }
            })
        }
    }
    $('#ordinatorOptionModal').modal('toggle')
}

function getSelectedCoSubOrdinator(spanList) {
    let coordinatorIndexes = '', subordinatorIndexes = '', antecedentIndexes = ''
    for (let i=0; i < spanList.length; i++) {
        if (spanList[i].className.indexOf('selected_subordinator') !== -1) {
            subordinatorIndexes += (i + " ")
        } else if (spanList[i].className.indexOf('selected_coordinator') !== -1) {
            coordinatorIndexes += (i + " ")
        } else if (spanList[i].className.indexOf('selected_antecedent') !== -1) {
            antecedentIndexes += (i + " ")
        }
    }
    subordinatorIndexes = subordinatorIndexes.trim()
    coordinatorIndexes = coordinatorIndexes.trim()
    antecedentIndexes = antecedentIndexes.trim()

    return [coordinatorIndexes, subordinatorIndexes, antecedentIndexes]
}

/**
 * 根据coordinator和subordinator重新clause对应的html显示
 */
function rebuildClause(textarea, clause, coordinatorIndexes, subordinatorIndexes, antecedentIndexes) {
    let coordinatorIndexSet = str2Set(coordinatorIndexes)
    let subordinatorIndexSet = str2Set(subordinatorIndexes)
    let antecedentIndexSet = str2Set(antecedentIndexes)
    clause = clause.replace(/\s+/g, ' ').trim()
    let clauseText = replaceFont(clause)
    let clauseTokenList = clauseText.split(' ')
    let rebuiltClause = ''
    let tokenCount = 0
    for (let i=0; i < clauseTokenList.length; i++) {
        let token = clauseTokenList[i]
        if (token.trim() === '' ) {
            continue
        }
        if (coordinatorIndexSet.has(tokenCount+'')) {
            rebuiltClause += "<font style='color: #28a745;'>"+ token.trim() +"</font> "
        } else if (subordinatorIndexSet.has(tokenCount+'')) {
            rebuiltClause += "<font style='color: #007bff;'>"+ token.trim() +"</font> "
        } else if (antecedentIndexSet.has(tokenCount+'')){
            rebuiltClause += "<font style='color: #fe7070;'>"+ token.trim() +"</font> "
        } else {
            rebuiltClause += token.trim() +" "
        }
        tokenCount++
    }
    $(textarea).html(rebuiltClause)
    $(textarea).attr('coordinator', coordinatorIndexes)
    $(textarea).attr('subordinator', subordinatorIndexes)
    $(textarea).attr('antecedent', antecedentIndexes)
}

function saveAnnotation() {
    let sentenceId = $("#ori_sentence").attr('sentence_id')
    let clauseList = []
    let parentNodeOffset = []
    let oldId2NewId = []
    $('.textarea').each(function (){
        let clause = {}
        clause.sentenceId = sentenceId
        clause.level = $(this).attr('level')
        let oldNodeId = $(this).attr('id')
        calculateNodeIdAndParentNodeId(clauseList, clause)
        oldId2NewId[oldNodeId] = clause.nodeId
        clause.clause = replaceFont($(this).html().trim())
        clause.coordinator = $(this).attr('coordinator') === 'null' ? '' : $(this).attr('coordinator')
        clause.subordinator = $(this).attr('subordinator') === 'null' ? '' : $(this).attr('subordinator')
        clause.antecedent = $(this).attr('antecedent') === 'null' ? '' : $(this).attr('antecedent')
        clause.subordinateType = ($(this).attr('subordinateType') == undefined) ? '' : $(this).attr('subordinateType')
        let clauseText = $(this).html().trim()
        clauseText = replaceFont(clauseText)
        clauseText = replaceSpan(clauseText)
        clause.clause = clauseText
        setClauseAndNLAU(this, parentNodeOffset, clause)

        if (parentNodeOffset.hasOwnProperty($(this).attr('id'))) {
            clause.offset = parentNodeOffset[$(this).attr('id')]
        } else {
            clause.offset = -1
        }
        clauseList.push(clause)
    })

    for (let i=0; i<clauseList.length; i++) {
        let tokenList = clauseList[i].clause.split(' ')
        let modifyClause = ''
        for (let j=0; j<tokenList.length; j++) {
            if (tokenList[j].indexOf('$NC*') != -1) {
                let oldId = tokenList[j].substring(4)
                let newId = oldId2NewId[oldId]
                modifyClause += '$NC*' + newId + ' '
            } else {
                modifyClause += tokenList[j] + ' '
            }
        }
        clauseList[i].clause = modifyClause.trim()
    }

    $.ajax({
        type: 'POST',
        url: 'clause_segmentation/save_annotation.do',
        dataType: 'json',                               //  表示返回值的数据类型
        contentType: 'application/json;charset=UTF-8',  //  内容类型
        traditional: true, //使json格式的字符串不会被转码
        data: JSON.stringify({clauseList: clauseList, sentenceId: sentenceId}),
        success: function (data) {
            if (data.success) {
                alert('保存成功！')
                window.location.reload()
            }
        }
    })
}

function setClauseAndNLAU(obj, parentNodeOffset, clause) {
    let clauseText = clause.clause
    let tokenArr = clauseText.split(' ')
    let tokenCount = 0
    let nclauIndexList = []
    clauseText = ''
    let mappedClauId = []

    $(obj).find('.N_CLAU').each(function (){
        let mappedTextareaId = $(this).attr('mapped_clause')
        mappedClauId.push(mappedTextareaId)
    })

    let index = 0
    for (let i=0; i < tokenArr.length; i++) {
        if (tokenArr[i] != '') {
            clauseText += tokenArr[i]
            if (tokenArr[i] == '$NC*') {
                nclauIndexList.push(tokenCount)
                clauseText += mappedClauId[index]
                index += 1
            }
            clauseText += ' '
            tokenCount += 1
        }
    }
    clause.clause = clauseText.trim()

    let nclauCount = 0
    $(obj).find('.N_CLAU').each(function (){
        let mappedTextareaId = $(this).attr('mapped_clause')
        parentNodeOffset[mappedTextareaId] = nclauIndexList[nclauCount]
        nclauCount += 1
    })
}

function calculateNodeIdAndParentNodeId(clauseList, clause) {
    let previousNodeId = '0'
    let currentLevel = parseInt(clause.level)
    let previousLevel = 1
    let previousParentNodeId = ''
    if (clauseList.length > 0) {
        previousNodeId = clauseList[clauseList.length-1].nodeId
        previousLevel = parseInt(clauseList[clauseList.length-1].level)
        previousParentNodeId = clauseList[clauseList.length-1].parentNodeId
    }

    if (currentLevel > previousLevel) {
        clause.nodeId = previousNodeId + '-1'
        clause.parentNodeId = previousNodeId
    } else if (currentLevel == previousLevel) {
        clause.nodeId = calculateSiblingNodeId(previousNodeId)
        clause.parentNodeId = previousParentNodeId
    } else {
        let parentNodeIdOfPreviousNode = previousNodeId
        while (previousLevel > currentLevel) {
            parentNodeIdOfPreviousNode = parentNodeIdOfPreviousNode.substring(0, parentNodeIdOfPreviousNode.lastIndexOf('-'))
            currentLevel += 1
        }
        clause.nodeId = calculateSiblingNodeId(parentNodeIdOfPreviousNode)
        let lastDashIndex = clause.nodeId.lastIndexOf('-')
        if (lastDashIndex == -1) {
            clause.parentNodeId = ''
        } else {
            clause.parentNodeId = clause.nodeId.substring(0, lastDashIndex)
        }
    }
}

function calculateSiblingNodeId(nodeId) {
    let lastDashIndex = nodeId.lastIndexOf('-')
    if (lastDashIndex == -1) {
        return (parseInt(nodeId) + 1) + ''
    } else {
        let parentNodeId = nodeId.substring(0, lastDashIndex)
        return parentNodeId + '-' + (parseInt(nodeId.substring(lastDashIndex + 1, nodeId.length)) + 1).toString()
    }
}

function changeAnnotationTab(obj, annotationId) {
    if ($(obj).attr('class') !== 'annotationTabSpan annotationTabSpanSelected') {
        let sentenceId = parseInt($('#ori_sentence').attr('sentence_id'))
        $.ajax({
            type: 'POST',
            url: 'clause_segmentation/switch_annotation.do',
            dataType: 'json',                               //  表示返回值的数据类型
            contentType: 'application/json;charset=UTF-8',  //  内容类型
            traditional: true, //   使json格式的字符串不会被转码
            data: JSON.stringify({annotationId: annotationId, sentenceId: sentenceId}),
            success: function (data) {
                if (data.success) {
                    let newTextareaList = ''
                    let clauseList = data.data["clauseList"]
                    let selectedTreeDict = data.data["selectedTreeDict"]
                    treeDict = selectedTreeDict
                    let selectedSubordinateTypeCNList = data.data["selectedSubordinateTypeCNList"]
                    for (let i = 0; i < clauseList.length; i++) {
                        newTextareaList += "" +
                            "<div class='clauseDiv'>" +
                            "<div class='subordinateClauseTypeSpan'>" +
                            "<span class='subordinateTypeCN' onClick='openOrdinatorOptionModal(this)'>" + selectedSubordinateTypeCNList[i] + "</span>" +
                            "</div>" +
                            "<div style='margin-left: " + clauseList[i].level * 50 + "px;' id='" + clauseList[i].nodeId + "' level='" + clauseList[i].level + "' class='textarea' readonly onClick='clickTextarea(this)' ondblclick='segment()' coordinator='" + clauseList[i].coordinator + "' subordinator='" + clauseList[i].subordinator + "' antecedent='" + clauseList[i].antecedent + "' offset='" + clauseList[i].offset + "' subordinateType='" + clauseList[i].subordinateType + "'>" +
                            clauseList[i].clause +
                            "</div>" +
                            "</div>"
                    }

                    $("#textareaList").html(newTextareaList)

                    $(obj).siblings().each(function () {
                        $(this).attr('class', 'annotationTabSpan')
                    })
                    $(obj).attr('class', 'annotationTabSpan annotationTabSpanSelected')
                    clause1 = ''
                    clause2 = ''
                    currentSelectedTextarea = null
                    previousClickTextarea = null

                    adjustSubordinateTypeSpanHeight()
                } else {
                    alert(data.message)
                }
            }
        })
    }
}

function chooseMain(obj) {
    $('.MOS_button').each(function (){
        $(this).attr('class', 'MOS_button')
    })
    $(obj).attr('class', 'MOS_button MOS_buttonSelected')
}

function changeSentence(annotationSeq) {
    window.location.href = 'clause_segmentation/to_segmentation_page.do?annotationSeq=' + annotationSeq;
}

function logout() {
    if (window.confirm("是否退出登录？")) {
        window.location.href = 'login/out.do'
    }
}

function jump2AnnotationSeq() {
    let specifiedAnnotationSeq = $('#specifiedAnnotationSeq').val()
    if (specifiedAnnotationSeq == null) {
        specifiedAnnotationSeq = 0
    }
    window.location.href = 'clause_segmentation/to_segmentation_page.do?annotationSeq=' + specifiedAnnotationSeq;
}

function showAMR() {
    $("#AMRModal").modal('toggle')
}