package com.aturstudio.util;

/**
 * @author Fan Yunlong
 * @create 2018/12/10 23:41
 * @update 2018/12/10 23:41
 */
public class MySetting {

    private int monitorLisDaysBefore;
    private String uploadReportUrl;
    private int lowTemperatureRuleId;
    private int highTemperatureRuleId;
    private String administrativeCode;  //  行政区编码
    private String organizationType;    //  单位性质
    private String organizationCode;    //  单位编码

    private String reporterOrganizationName;        //  填写不良反应报告时默认——报告人单位
    private String organizationContactPerson;       //  填写不良反应报告时默认——报告单位联系人
    private String organizationContactPhoneNum;     //  填写不良反应报告时默认——报告单位联系电话

    public int getMonitorLisDaysBefore() {
        return monitorLisDaysBefore;
    }

    public void setMonitorLisDaysBefore(int monitorLisDaysBefore) {
        this.monitorLisDaysBefore = monitorLisDaysBefore;
    }

    public String getUploadReportUrl() {
        return uploadReportUrl;
    }

    public void setUploadReportUrl(String uploadReportUrl) {
        this.uploadReportUrl = uploadReportUrl;
    }

    public int getLowTemperatureRuleId() {
        return lowTemperatureRuleId;
    }

    public void setLowTemperatureRuleId(int lowTemperatureRuleId) {
        this.lowTemperatureRuleId = lowTemperatureRuleId;
    }

    public int getHighTemperatureRuleId() {
        return highTemperatureRuleId;
    }

    public void setHighTemperatureRuleId(int highTemperatureRuleId) {
        this.highTemperatureRuleId = highTemperatureRuleId;
    }

    public String getAdministrativeCode() {
        return administrativeCode;
    }

    public void setAdministrativeCode(String administrativeCode) {
        this.administrativeCode = administrativeCode;
    }

    public String getOrganizationType() {
        return organizationType;
    }

    public void setOrganizationType(String organizationType) {
        this.organizationType = organizationType;
    }

    public String getOrganizationCode() {
        return organizationCode;
    }

    public void setOrganizationCode(String organizationCode) {
        this.organizationCode = organizationCode;
    }

    public String getReporterOrganizationName() {
        return reporterOrganizationName;
    }

    public void setReporterOrganizationName(String reporterOrganizationName) {
        this.reporterOrganizationName = reporterOrganizationName;
    }

    public String getOrganizationContactPerson() {
        return organizationContactPerson;
    }

    public void setOrganizationContactPerson(String organizationContactPerson) {
        this.organizationContactPerson = organizationContactPerson;
    }

    public String getOrganizationContactPhoneNum() {
        return organizationContactPhoneNum;
    }

    public void setOrganizationContactPhoneNum(String organizationContactPhoneNum) {
        this.organizationContactPhoneNum = organizationContactPhoneNum;
    }
}
