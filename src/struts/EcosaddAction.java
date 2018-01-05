package struts;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import po.EcosEntity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * Created by Rose on 2017/10/13.
 */
public class EcosaddAction extends ActionSupport {

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getTem() {
        return tem;
    }

    public void setTem(String tem) {
        this.tem = tem;
    }

    public String getHum() {
        return hum;
    }

    public void setHum(String hum) {
        this.hum = hum;
    }

    public String getPm() {
        return pm;
    }

    public void setPm(String pm) {
        this.pm = pm;
    }

    public String getWind() {
        return wind;
    }

    public void setWind(String wind) {
        this.wind = wind;
    }

    public String getClo() {
        return clo;
    }

    public void setClo(String clo) {
        this.clo = clo;
    }

    private String day;
    private String tem;
    private String hum;
    private String pm;
    private String wind;
    private String clo;

    public String execute() throws Exception {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
        HttpServletRequest request = ServletActionContext.getRequest();
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        Configuration cfg=new Configuration().configure();
        SessionFactory sf=cfg.buildSessionFactory();
        Session hs=sf.openSession();
        Transaction ts=hs.beginTransaction();

        EcosEntity s = new EcosEntity();
        s.setDay(java.sql.Date.valueOf(day));
        s.setTemperature(tem);
        s.setHumidity(hum);
        s.setPm(pm);
        s.setWind(wind);
        s.setClothes(clo);
        System.out.println(s.getDay()+" "+s.getClothes());

        hs.save(s);

        ts.commit();
        hs.close();
        return SUCCESS;
    }
}
