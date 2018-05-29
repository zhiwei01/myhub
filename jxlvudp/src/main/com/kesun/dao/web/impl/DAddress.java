package kesun.dao.web.impl;

import kesun.dao.DaoSupport;
import kesun.dao.web.INotice;
import org.springframework.stereotype.Repository;

/**
 * Created by heying on 2017/10/29.
 */
@Repository("daddress")
public class DAddress extends DaoSupport implements INotice {
    public DAddress() {
        setMapperName("mapper.AddressMapper");
    }
    public Boolean objectInUse(String id)
    {
        return false;
    }
}
