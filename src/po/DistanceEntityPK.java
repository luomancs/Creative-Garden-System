package po;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by Rose on 2017/10/10.
 */
public class DistanceEntityPK implements Serializable {
    private int sid1;
    private int sid2;

    @Column(name = "sid1")
    @Id
    public int getSid1() {
        return sid1;
    }

    public void setSid1(int sid1) {
        this.sid1 = sid1;
    }

    @Column(name = "sid2")
    @Id
    public int getSid2() {
        return sid2;
    }

    public void setSid2(int sid2) {
        this.sid2 = sid2;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DistanceEntityPK that = (DistanceEntityPK) o;

        if (sid1 != that.sid1) return false;
        if (sid2 != that.sid2) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = sid1;
        result = 31 * result + sid2;
        return result;
    }
}
