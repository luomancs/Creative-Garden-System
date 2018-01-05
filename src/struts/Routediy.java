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

import java.util.ArrayList;

/**
 * Created by Rose on 2017/10/17.
 */
public class Routediy  extends ActionSupport {
    private String end;

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }
    public String execute() throws Exception {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
        HttpServletRequest request = ServletActionContext.getRequest();
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("终点:"+end);
        Configuration cfg=new Configuration().configure();
        SessionFactory sf=cfg.buildSessionFactory();
        Session hsession=sf.openSession();
        Transaction ts=hsession.beginTransaction();
        Query hquery=hsession.createQuery("FROM SceneryEntity s where s.name=?");
        hquery.setString(0, end);
        List<SceneryEntity> s = hquery.list();
        int id = s.get(0).getId() - 1;

        int M=10000;//(此路不通)

        int[][] weight = {
                {0,1,7,M,8},
                {1,0,7,M,M},
                {7,7,0,M,5},
                {M,M,M,0,4},
                {8,M,5,4,0}
        };
        int start=0;
        //接受一个有向图的权重矩阵，和一个起点编号start（从0编号，顶点存在数组中）
        //返回一个int[] 数组，表示从start到它的最短路径长度

        int e = id;
        int n = weight.length;        //顶点个数
        int[] shortPath = new int[n];    //存放从start到其他各点的最短路径
        String[] path=new String[n]; //存放从start到其他各点的最短路径的字符串表示
        for(int i=0;i<n;i++) {
            String na = "";
            if(i==0)    na = "谷底森林";
            else if(i==1)   na = "聚龙泉";
            else if(i==2)   na = "黑风口";
            else if(i==3)   na = "天豁峰";
            else if(i==4)   na = "岳桦林";
            path[i] = new String("谷底森林" + "-->" +na);
        }
        int[] visited = new int[n];   //标记当前该顶点的最短路径是否已经求出,1表示已求出

        //初始化，第一个顶点求出
        shortPath[start] = 0;
        visited[start] = 1;

        for(int count = 1;count <= n - 1;count++)  //要加入n-1个顶点
        {

            int k = -1;    //选出一个距离初始顶点start最近的未标记顶点
            int dmin = Integer.MAX_VALUE;
            for(int i = 0;i < n;i++)
            {
                if(visited[i] == 0 && weight[start][i] < dmin)
                {
                    dmin = weight[start][i];

                    k = i;
                }

            }

            //将新选出的顶点标记为已求出最短路径，且到start的最短路径就是dmin
            shortPath[k] = dmin;

            visited[k] = 1;

            //以k为中间点，修正从start到未访问各点的距离
            for(int i = 0;i < n;i++)
            {
                String na = "";
                if(i==0)    na = "谷底森林";
                else if(i==1)   na = "聚龙泉";
                else if(i==2)   na = "黑风口";
                else if(i==3)   na = "天豁峰";
                else if(i==4)   na = "岳桦林";
                if(visited[i] == 0 && weight[start][k] + weight[k][i] < weight[start][i]){
                    weight[start][i] = weight[start][k] + weight[k][i];


                    path[i]=path[k]+"-->"+na;

                }

            }

        }
        String tip = "从 谷底森林 出发到 "+end+" 的最短路径为：";
        String p = path[e];
        String sp =" 最短距离为："+shortPath[id]+"公里";

        System.out.println("------------------------------");
        System.out.println(tip);
        System.out.println(p);
        System.out.println(sp);

        request.setAttribute("tip",tip);
        request.setAttribute("p",p);

        String place[]=p.split("-->");
        List<String> placeList=new ArrayList<String>();

        System.out.println(place.length);
        for(int i=0;i<place.length;i++){
            placeList.add(place[i]);
        }
        System.out.println();
        request.getSession().setAttribute("placeList",placeList);

        request.setAttribute("sp",sp);


        return SUCCESS;
    }
}
