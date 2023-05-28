package com.aturstudio.dto.util;

import com.github.pagehelper.PageInfo;

import java.util.List;

public class PageUtil {

    private int startNum;           //  分页起始序号

    private int limit;              //  单页实体数量

    private int pageNum;            //  页码

    private int totalPageNum;       //  总页数

    private long totalEntryNum;     //  实体总数

    private int numberOfPages;      //  每页最多显示多少个页码

    private String url;             //  查询链接

    /**
     * 对于不设置分页的，统一只查第 1 页第 1 个
     */
    public PageUtil() {
        setStartNum(1);
        setLimit(10);
        setPageNum(1);
    }

    public int getStartNum() {
        return startNum;
    }

    public void setStartNum(int startNum) {
        this.startNum = startNum;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getTotalPageNum() {

        if (totalPageNum == 0) {
            totalPageNum = 1;
        }
        return totalPageNum;
    }

    public void setTotalPageNum(int totalPageNum) {
        this.totalPageNum = totalPageNum;
    }

    public long getTotalEntryNum() {
        return totalEntryNum;
    }

    public void setTotalEntryNum(long totalEntryNum) {
        this.totalEntryNum = totalEntryNum;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getNumberOfPages() {
        return numberOfPages;
    }

    public void setNumberOfPages(int numberOfPages) {
        this.numberOfPages = numberOfPages;
    }

    public void setValueAfterSearch(List list) {
        PageInfo pageInfo = new PageInfo(list);
        setTotalEntryNum(pageInfo.getTotal());
        setTotalPageNum(pageInfo.getPages());
        setStartNum((getPageNum() - 1) * getLimit() + 1);
        if (totalPageNum > 5) {
            setNumberOfPages(5);
        } else {
            setNumberOfPages(totalPageNum);
        }

    }
}
