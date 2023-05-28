package src;

import java.io.*;

public class ModifySQLServerSQL {

    public static void main(String[] args) {
        try {
            String pathname = "D:\\lis.sql"; // 绝对路径或相对路径都可以，这里是绝对路径，写入文件时演示相对路径
            File filename = new File(pathname); // 要读取以上路径的input。txt文件
            InputStreamReader reader = new InputStreamReader(
                    new FileInputStream(filename), "UTF-8"); // 建立一个输入流对象reader
            BufferedReader br = new BufferedReader(reader); // 建立一个对象，它把文件内容转成计算机能读懂的语言
            String line = "";

            // 写入Txt文件
            File writeName = new File("D:\\oracle_lis-50000.sql");
            writeName.createNewFile(); // 创建新文件
            BufferedWriter out = new BufferedWriter(new FileWriter(writeName));
            int count = 0;
            while (line != null) {
                line = br.readLine(); // 一次读入一行数据
                if (null == line) {
                    break;
                }
                if ("GO".equals(line)) {
                    continue;
                }

                count++;
                line = line.replaceAll("\\[", "");
                line = line.replaceAll("]", "");
                line = line.replaceAll("INSERT INTO", "INSERT INTO LIS");
                line = line.replaceAll("'2018-", "to_date('2018-");
                line = line.replaceAll("\\.000'", "', 'yyyy-mm-dd hh24:mi:ss')");
                //System.out.println(line);
                out.write(line + "\n");
                if (count%100 == 0) {
                    out.write("commit;\n");
                    out.flush();
                    System.out.println("转换了sql记录数量："+count);
                }
                if (count > 50000) {
                    break;
                }
            }
            out.write("commit;");
            out.flush();
            out.close(); // 最后记得关闭文件
            System.out.println("转换了sql记录数量："+count);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}