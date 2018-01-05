package struts;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import po.BotanyEntity;
import po.SceneryEntity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Rose on 2017/10/10.
 */
public class ScedeleAction  extends ActionSupport {


    public String execute() throws Exception {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
        HttpServletRequest request = ServletActionContext.getRequest();
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String[] ids = request.getParameterValues("check");
        if (ids == null) {
            out.print("<script language=\"javascript\">alert(\"没有选中\");</script>");
            response.setHeader("refresh", "0.1;URL=first.jsp");
        } else {
            for (String value : ids) {
                int id = Integer.parseInt(value);
                Configuration cfg = new Configuration().configure();
                SessionFactory sf = cfg.buildSessionFactory();
                Session hs = sf.openSession();
                Transaction ts = hs.beginTransaction();
                SceneryEntity ly = (SceneryEntity) hs.get(SceneryEntity.class, new Integer(id));

                ts.commit();
                hs.close();

                Session hs2 = sf.openSession();
                Transaction ts2 = hs2.beginTransaction();
                hs2.delete(ly);
                ts2.commit();
                hs2.close();
            }
            return SUCCESS;
        }
        return ERROR;
    }
}
