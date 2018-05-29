package kesun.controller.web.impl;


import kesun.bll.SuperService;
import kesun.bll.web.INotice;

import kesun.bll.web.impl.AddressServiceImpl;
import kesun.controller.SuperController;
import kesun.util.JSONAndObject;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by heying on 2017/10/29.
 */
@Controller
@RequestMapping("address")
public class AddressController extends SuperController implements INotice {
    @Resource(name = "baddress")
    private AddressServiceImpl bll;
    public SuperService getService() {
        return bll;
    }




    @RequestMapping("/index")
    public String index(){
        return "web/address/addressManage";
    }



    public Map<String, Object> getConditionParam(JSONObject param) {
        if (param==null) return  null;//判断条件是否为空param是页面传递的值
        Map<String,Object> values=new HashMap<String, Object>();
        if (JSONAndObject.GetJsonStringValue(param,"condition")!=null)
        {
            values.put("id", JSONAndObject.GetJsonStringValue(param,"condition"));
            values.put("name",JSONAndObject.GetJsonStringValue(param,"condition"));
        }
        return values;
    }

    public Map<String, Object> setFindFilter(JSONObject param) {
        return null;
    }
}
