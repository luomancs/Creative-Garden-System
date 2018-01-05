package struts;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.Query;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;


import po.*;
import java.util.List;
import java.util.Map;

/**
 * Created by Rose on 2017/7/9.
 */
public class LoginAction extends ActionSupport {
    private int id;
    private String pw;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String execute() throws Exception {
        HttpServletResponse response =  ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
        PrintWriter out = response.getWriter();
        System.out.println(id+" "+pw);
        Configuration cfg = new  Configuration().configure();
        SessionFactory sf = cfg.buildSessionFactory();
        Session hsession = sf.openSession();
        Transaction ts = hsession.beginTransaction();
        Query hquery = hsession.createQuery("from UserEntity u where u.id=?");
        hquery.setInteger(0, id);
        List userList = hquery.list();

        if(userList.size() == 1){
            UserEntity uu = (UserEntity) userList.get(0);
            ActionContext acontext = ActionContext.getContext();
            Map session=acontext.getSession();
            Map application=acontext.getApplication();
            HttpServletRequest request = ServletActionContext.getRequest();
            int userid = id;
            request.setAttribute("userid", userid);
            if (uu.getPassword().equals(pw)) {
                if (uu.getTap().equals("管理员")) {
                    //out.print("<script>alert('管理员登录');</script>");

                    ts.commit();
                    hsession.close();
                    return SUCCESS;
                } else  {
                    //out.print("<script>alert('用户登录');</script>");

                    ts.commit();
                    hsession.close();
                    return NONE;
                }

            }
            else {
                System.out.print("密码错误");
                out.print("<script>alert('密码错误！');location.href='index.jsp'</script>");
                out.flush();
                out.close();
                ts.commit();
                hsession.close();
                return ERROR;
            }

        }
        else{
            System.out.print("用户不存在");
            out.print("<script>alert('用户不存在！');location.href='index.jsp'</script>");
            out.flush();
            out.close();

            ts.commit();
            hsession.close();
            return ERROR;

        }

    }

}
