package com.aturstudio.dto.common;

import com.aturstudio.util.StringUtil;

/**
 * User: Lu Tingming
 * Time: 2009-12-28
 * Desc: 业务逻辑层返回的消息
 */
public class BLMessage {
    /** 是否成功 */
    protected boolean success;

    /** 消息 */
    protected String message;

    /** 结果 */
    protected Object data;


    public BLMessage() {
        this.success = true;
    }


    public BLMessage(boolean success) {
        this.success = success;
    }

    public BLMessage(boolean success, String message) {
        this.success = success;
        this.message = message;
    }

    public BLMessage(boolean success, String message, Object data) {
        this.success = success;
        this.data = data;
        this.message = message;
    }

    /**
     * @return 合并后的字符串
     */
    public String toString(){
        String s = success ? "OK" : "ERROR";

        if(StringUtil.notEmpty(message)){
            s+=":"+message;
        }

        if(data!=null){
            s+="["+data+"]";
        }

        return s;
    }


    /**
     * @return the data
     */
    public Object getData() {
        return data;
    }


    /**
     * @param data the data to set
     */
    public void setData(Object data) {
        this.data = data;
    }


    /**
     * @return the success
     */
    public boolean isSuccess() {
        return success;
    }


    /**
     * @param success the success to set
     */
    public void setSuccess(boolean success) {
        this.success = success;
    }


    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }


    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
    }

    public void appendMessage(String message) {
        if(StringUtil.isEmpty(this.message)) {
            this.message = message;
        } else {
            this.message += "\n"+message;
        }
    }

    public void appendMessage(BLMessage blMessage) {
        this.success = this.success && blMessage.success;
        appendMessage(blMessage.getMessage());
    }
}
