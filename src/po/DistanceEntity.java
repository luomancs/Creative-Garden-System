package po;

import javax.persistence.*;

/**
 * Created by Rose on 2017/10/10.
 */
@Entity
//@Table(name = "distance", schema = "BotanyPark", catalog = "")
@IdClass(DistanceEntityPK.class)
public class DistanceEntity {
    private int sid1;
    private int sid2;
    private String dis;

    @Id
    @Column(name = "sid1")
    public int getSid1() {
        return sid1;
    }

    public void setSid1(int sid1) {
        this.sid1 = sid1;
    }

    @Id
    @Column(name = "sid2")
    public int getSid2() {
        return sid2;
    }

    public void setSid2(int sid2) {
        this.sid2 = sid2;
    }

    @Basic
    @Column(name = "dis")
    public String getDis() {
        return dis;
    }

    public void setDis(String dis) {
        this.dis = dis;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DistanceEntity that = (DistanceEntity) o;

        if (sid1 != that.sid1) return false;
        if (sid2 != that.sid2) return false;
        if (dis != null ? !dis.equals(that.dis) : that.dis != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = sid1;
        result = 31 * result + sid2;
        result = 31 * result + (dis != null ? dis.hashCode() : 0);
        return result;
    }
}
