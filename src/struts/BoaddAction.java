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
 * Created by Rose on 2017/10/13.
 */
public class BoaddAction  extends ActionSupport {
    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    private int sid;
    private int sceid;

    private String scename;
    private String scecontext;
    public int getSceid() {
        return sceid;
    }

    public void setSceid(int sceid) {
        this.sceid = sceid;
    }

    public String getScename() {
        return scename;
    }

    public void setScename(String scename) {
        this.scename = scename;
    }

    public String getScecontext() {
        return scecontext;
    }

    public void setScecontext(String scecontext) {
        this.scecontext = scecontext;
    }


    public String execute() throws Exception {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
        HttpServletRequest request = ServletActionContext.getRequest();
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        BotanyEntity s=new BotanyEntity();
        s.setId(sceid);
        s.setSid(sid);
        s.setName(scename);
        s.setContext(scecontext);
        Configuration cfg=new Configuration().configure();
        SessionFactory sf=cfg.buildSessionFactory();
        Session hs=sf.openSession();
        Transaction ts=hs.beginTransaction();
        hs.save(s);
        ts.commit();
        hs.close();
        return SUCCESS;
    }

}
