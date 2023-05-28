package com.aturstudio.util;

import java.math.BigDecimal;

/**
 * @author Fan Yunlong
 * @create 2018/6/22 下午 11:55
 * @update 2018/6/22 下午 11:55
 */
public class NumberUtil {

    /**
     * 判断结果值是否在区间中
     * @param result
     * @param minValue
     * @param maxValue
     * @return
     */
    public static boolean isInZone(BigDecimal result, BigDecimal minValue, BigDecimal maxValue) {
        boolean isIn = false;
        if (minValue != null) {
            if (minValue.compareTo(result) <= 0) {
                if (maxValue != null) {
                    if (maxValue.compareTo(result) >= 0) {
                        isIn = true;     //  下界不为空，上界不为空，result在上下界之间
                    }
                } else {
                    isIn = true;         //  下界不为空，上界为空，result大于下界
                }
            }
        } else {
            if (maxValue != null) {
                if (maxValue.compareTo(result) >= 0) {
                    isIn = true;         //  上界不为空，上界不为空，result小于在上界
                }
            }
        }
        return isIn;
    }

    public static BigDecimal getDelta(BigDecimal x, BigDecimal y) {
        if (null == x) {
            if (null != y) {
                return y;
            } else {
                return new BigDecimal(0);
            }
        } else {
            if (null != y) {
                if (y.subtract(x).compareTo(new BigDecimal(0)) < 0) {
                    return x.subtract(y);
                } else {
                    return y.subtract(x);
                }
            } else {
                return x;
            }
        }
    }

}
