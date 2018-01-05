package struts;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import po.BotanyEntity;
import po.SceneryEntity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by Rose on 2017/10/18.
 */
public class SceaddpiAction extends ActionSupport {
    private static final long serialVersionUID = 1L;


    public String execute() throws Exception {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
        HttpServletRequest request = ServletActionContext.getRequest();
        //PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        System.out.println("coming.......");
        //ServletActionContext.getServletContext().getRealPath(File.separator);
        String savePath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/upload");
        ;
        String tempPath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/temp");
        File tmpFile = new File(tempPath);

        if (!tmpFile.exists()) {
            tmpFile.mkdir();
        }
        //消息提示
        String message = "";

        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(1024 * 100);//设置缓冲区的大小为100KB，如果不指定，那么缓冲区的大小默认是10KB
        factory.setRepository(tmpFile);
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setHeaderEncoding("UTF-8");
        if (!ServletFileUpload.isMultipartContent(request)) {
            return ERROR;
        }
        //设置上传单个文件的大小的最大值，目前是设置为3MB
        upload.setFileSizeMax(1024 * 1024 * 3);
        //设置上传文件总量的最大值，最大值=同时上传的多个文件的大小的最大值的和，目前设置为10MB
        upload.setSizeMax(1024 * 1024 * 10);
        List<FileItem> list = upload.parseRequest(request);
        for (FileItem item : list) {
            if (item.isFormField()) {
                String name = item.getFieldName();
                String value = item.getString("UTF-8");
                System.out.println(name + "=" + value);
            } else {
                System.out.println("!!!!!!!!!!");
                String filename = item.getName();
                System.out.println(filename + "..");
                if (filename == null || filename.trim().equals("")) {
                    continue;
                }
                filename = filename.substring(filename.lastIndexOf("\\") + 1);
                String fileExtName = filename.substring(filename.lastIndexOf(".") + 1);
                System.out.println("上传的文件的扩展名是：" + fileExtName);
                InputStream in = item.getInputStream();
                String saveFilename = makeFileName(filename);
                String realSavePath = makePath(saveFilename, savePath);
                FileOutputStream out = new FileOutputStream(realSavePath + "/" + saveFilename);

                byte buffer[] = new byte[1024];
                int len = 0;
                StringBuffer sb = new StringBuffer();
                while ((len = in.read(buffer)) > 0) {
                    sb.append(new String(buffer, 0, len));
                    out.write(buffer, 0, len);
                }
                String ss = sb.toString();
                in.close();
                out.close();
                System.out.println(realSavePath + "/" + saveFilename);
                save(realSavePath + "/" + saveFilename);
                System.out.println("end");
                PrintWriter p = response.getWriter();
                p.print("上传成功");




            }
        }
        return SUCCESS;
    }




        public void save (String path) throws IOException, SQLException {

            SceneryEntity s = null;
            List<SceneryEntity> sr = readXls(path);
            System.out.println("start");

            for (int i = 0; i < sr.size(); i++) {
                s = sr.get(i);
                Configuration cfg = new Configuration().configure();
                SessionFactory sf = cfg.buildSessionFactory();
                Session hs = sf.openSession();
                Transaction ts = hs.beginTransaction();
                hs.save(s);
                ts.commit();
                hs.close();
//            Course cm = dao.DAOFactory.getCourseDAO().getCourse(c.GetId());
//            if(cm.GetId()==0){
//                dao.DAOFactory.getCourseDAO().insertCourse(c);
//                System.out.println(c.GetId()+"插入成功");
//            }
//            else{
//                System.out.println(c.GetId()+"该题目已存在");
//            }

            }

        }
        private String makeFileName (String filename){  //2.jpg
            //为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
            return UUID.randomUUID().toString() + "_" + filename;
        }


        private String makePath (String filename, String savePath){
            //得到文件名的hashCode的值，得到的就是filename这个字符串对象在内存中的地址
            int hashcode = filename.hashCode();
            int dir1 = hashcode & 0xf;  //0--15
            int dir2 = (hashcode & 0xf0) >> 4;  //0-15
            //构造新的保存目录
            String dir = savePath + "/" + dir1 + "/" + dir2;  //upload\2\3  upload\3\5
            //File既可以代表文件也可以代表目录
            File file = new File(dir);
            //如果目录不存在
            if (!file.exists()) {
                //创建目录
                file.mkdirs();
            }
            return dir;
        }
        public List<SceneryEntity> readXls (String path) throws IOException {
            InputStream is = new FileInputStream(path);
            HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
            SceneryEntity s = null;
            List<SceneryEntity> sr = new ArrayList<SceneryEntity>();
            // 循环工作表Sheet
            for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
                HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
                if (hssfSheet == null) {
                    continue;
                }
                // 循环行Row
                for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
                    HSSFRow hssfRow = hssfSheet.getRow(rowNum);
                    if (hssfRow != null) {
                        s = new SceneryEntity();
                        //HSSFCell course_id = hssfRow.getCell(0);
                        HSSFCell id = hssfRow.getCell(0);
                        HSSFCell name = hssfRow.getCell(1);
                        HSSFCell context = hssfRow.getCell(2);

                        s.setId(id.getCellType());
                        s.setName(name.getStringCellValue());
                        s.setContext(context.getStringCellValue());
                        sr.add(s);


                    }
                }
            }
            return sr;
        }
        private String getValue (HSSFCell hssfCell){
            if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) {
                // 返回布尔类型的值
                return String.valueOf(hssfCell.getBooleanCellValue());
            } else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
                // 返回数值类型的值
                return String.valueOf(hssfCell.getNumericCellValue());
            } else {
                // 返回字符串类型的值
                return String.valueOf(hssfCell.getStringCellValue());
            }
        }

}
