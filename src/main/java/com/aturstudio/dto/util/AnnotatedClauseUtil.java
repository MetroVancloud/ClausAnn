package com.aturstudio.dto.util;

import com.aturstudio.entity.AnnotatedClause;
import com.aturstudio.util.StringUtil;

import java.util.HashSet;
import java.util.Set;

public class AnnotatedClauseUtil {

    public static String getSubordinateTypeCN(String subordinateType) {
        if ("subjective".equals(subordinateType)) {
            return "主语";
            //return "Sub."
        } else if ("objective".equals(subordinateType)) {
            return "宾语";
            //return "Obj."
        } else if ("predicative".equals(subordinateType)) {
            return "表语";
            //return "Pred."
        } else if ("appositive".equals(subordinateType)) {
            return "同位";
            //return "Appo."
        } else if ("relative".equals(subordinateType)) {
            return "关系";
            //return "Rel."
        } else if ("adverbial".equals(subordinateType)) {
            return "状语";
            //return "Adv."
        } else if ("adv.time".equals(subordinateType)) {
            return "时间状语";
            //return "Adv."
        } else if ("adv.place".equals(subordinateType)) {
            return "地点状语";
            //return "Adv."
        } else if ("adv.condition".equals(subordinateType)) {
            return "条件状语";
            //return "Adv."
        } else if ("adv.concession".equals(subordinateType)) {
            return "让步状语";
            //return "Adv."
        } else if ("adv.reason".equals(subordinateType)) {
            return "原因状语";
            //return "Adv."
        } else if ("adv.purpose".equals(subordinateType)) {
            return "目的状语";
            //return "Adv."
        } else if ("adv.result".equals(subordinateType)) {
            return "结果状语";
            //return "Adv."
        } else if ("adv.manner".equals(subordinateType)) {
            return "方式状语";
            //return "Adv."
        } else if ("adv.comparation".equals(subordinateType)) {
            return "比较状语";
            //return "Adv."
        } else if ("main".equals(subordinateType)){
            return "主句";
        } else if ("op".equals(subordinateType)){
            return "OP";
        } else {
            return "";
        }
    }

    public static void rebuildClause(AnnotatedClause annotatedClause) {
        Set<Integer> coordinatorSet = new HashSet<>();
        Set<Integer> subordinatorSet = new HashSet<>();
        Set<Integer> antecedentSet = new HashSet<>();
        if (StringUtil.isEmpty(annotatedClause.getCoordinator())) {
            annotatedClause.setCoordinator("");
        } else {
            coordinatorSet = str2IntegerSet(annotatedClause.getCoordinator());
        }
        if (StringUtil.isEmpty(annotatedClause.getSubordinator())) {
            annotatedClause.setSubordinator("");
        } else {
            subordinatorSet = str2IntegerSet(annotatedClause.getSubordinator());
        }
        if (StringUtil.isEmpty(annotatedClause.getAntecedent())) {
            annotatedClause.setAntecedent("");
        } else {
            antecedentSet = str2IntegerSet(annotatedClause.getAntecedent());
        }

        String[] tokenArr = annotatedClause.getClause().split(" ");
        String clauseText = "";
        for (int i = 0; i < tokenArr.length; i++) {
            if (coordinatorSet.contains(i)) {
                clauseText += "<font style='color: #28a745;'>" + tokenArr[i] + "</font>";
            } else if (subordinatorSet.contains(i)) {
                clauseText += "<font style='color: #007bff;'>" + tokenArr[i] + "</font>";
            } else if (antecedentSet.contains(i)) {
                clauseText += "<font style='color: #fe7070;'>" + tokenArr[i] + "</font>";
            } else if (tokenArr[i].indexOf("$NC*") != -1) {
                clauseText += "<span class='N_CLAU' style='font-weight: bold;color: red;' mapped_clause='" + tokenArr[i].substring(4) + "'>$NC*</span>";
            } else {
                clauseText += tokenArr[i];
            }
            if (i != tokenArr.length-1) {
                clauseText += " ";
            }
        }
        annotatedClause.setClause(clauseText);
    }

    public static Set<Integer> str2IntegerSet(String str) {
        if (StringUtil.isEmpty(str)) {
            return new HashSet<>();
        } else {
            Set<Integer> set = new HashSet<>();
            String[] arr = str.split(" ");
            for (int i = 0; i < arr.length; i++) {
                set.add(Integer.valueOf(arr[i]));
            }
            return set;
        }
    }
}
