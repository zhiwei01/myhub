package kesun.bll.web.impl;

import kesun.bll.SuperService;
import kesun.dao.IDoData;
import kesun.dao.web.INotice;
import kesun.dao.web.impl.DAddress;
import kesun.dao.web.impl.DTest;
import kesun.entity.web.Address;
import kesun.entity.web.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by heying on 2017/10/29.
 */
@Service("baddress")
public class AddressServiceImpl extends SuperService implements INotice {
    @Resource(name = "daddress")
    private DAddress dao;

    public AddressServiceImpl() {
        setModel(new Address());
    }

    public List<Map<String, Object>> getLoadoutExcelColumns() {
        return null;
    }

    public String getLoadoutExcelFileName() {
        return "地址信息";
    }

    public IDoData getDAO() {
        return dao;
    }

    public List getSaveAll(String filePath) {
        return null;
    }

    @Override
    public Boolean isInUse() {
        return false;
    }
}
