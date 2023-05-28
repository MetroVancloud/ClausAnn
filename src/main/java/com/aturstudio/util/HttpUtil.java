package com.aturstudio.util;

import org.apache.log4j.Logger;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map;

/**
 * @author Fan Yunlong
 * @create 2019/2/24 22:16
 * @update 2019/2/24 22:16
 */
public class HttpUtil {
    private static Logger logger  = Logger.getLogger(HttpUtil.class);

    /**
     * 向指定URL发送GET方法的请求
     *
     * @param url 发送请求的URL
     * @param param 请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return 所代表远程资源的响应结果
     */
    public String sendGet(String url, String param, String responseEncoder) {
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString = url + "?" + param;
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();

            connection.setConnectTimeout(3000);
            connection.setReadTimeout(3000);
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user_manage-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
            /*for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }*/
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream(), responseEncoder));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            logger.error("发送GET请求出现异常！" + url);
            logger.error(this, e);
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }

    /**
     * 向指定 URL 发送POST方法的请求
     * @return 所代表远程资源的响应结果
     * @param url 发送请求的 URL
     */
    public String sendPost(String url, String param) {
        OutputStreamWriter out = null;
        BufferedReader reader = null;
        String response = "";
        try {
            URL httpUrl = null; //HTTP URL类 用这个类来创建连接
            // 创建URL
            httpUrl = new URL(url);

            //建立连接
            HttpURLConnection conn = (HttpURLConnection) httpUrl.openConnection();
            conn.setConnectTimeout(10000);
            conn.setReadTimeout(10000);
            conn.setRequestMethod("POST");
            //conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Charset", "UTF-8");
            conn.setRequestProperty("Content-Type","application/json; charset=UTF-8");
            conn.setRequestProperty("connection", "keep-alive");
            conn.setUseCaches(false);//设置不要缓存
            conn.setInstanceFollowRedirects(true);
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.connect();
            //POST请求
            out = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
            out.write(param);
            out.flush();
            //读取响应
            reader = new BufferedReader(new InputStreamReader(
                    conn.getInputStream(),"utf-8"));
            String lines;
            while ((lines = reader.readLine()) != null) {
                lines = new String(lines.getBytes());
                response += lines;
            }
            reader.close();
            // 断开连接
            conn.disconnect();

        } catch (Exception e) {

            System.out.println("发送 POST 请求出现异常！" + e);

            e.printStackTrace();

        }

        //使用finally块来关闭输出流、输入流

        finally {

            try {
                if (out != null) {
                    out.close();
                }
                if (reader != null) {
                    reader.close();
                }
            } catch(IOException ex){
                ex.printStackTrace();

            }
            return response;
        }
    }

    /*public String postJson(String uri, String json, int connectTimeout, int connectionRequestTimeout, int socketTimeout)
            throws IOException, ParseException {
        if (StringUtils.isEmpty(json)) {
            return null;
        }

        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost post = new HttpPost(uri);
        // Create request data
        StringEntity entity = new StringEntity(json, ContentType.APPLICATION_JSON);
        // Set request body
        post.setEntity(entity);

        RequestConfig config = RequestConfig.custom().setConnectTimeout(connectTimeout)
                .setConnectionRequestTimeout(connectionRequestTimeout).setSocketTimeout(socketTimeout).build();
        post.setConfig(config);
        // Response content
        String responseContent = null;
        CloseableHttpResponse response = null;
        try {
            response = client.execute(post);
            if (response.getStatusLine().getStatusCode() == HttpStatus.OK.value()) {
                responseContent = EntityUtils.toString(response.getEntity(), Consts.UTF_8.name());
            }
        } finally {
            if (null != response) {
                response.close();
            }
            if (null == client) {
                client.close();
            }
        }
        return responseContent;
    }*/
}

