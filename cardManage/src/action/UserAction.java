package action;
import java.util.Map;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;
import dao.UserDao;
public class UserAction extends ActionSupport implements RequestAware,SessionAware{
	private static final long serialVersionUID = 1L;
	private String flag;
	private String uname;
	private String upass;
	private Map<String, Object> request;
	private Map<String, Object> session;
	UserDao ud = new UserDao();
	public String register(){
		try {
			if("0".equals(flag)){
				if(ud.isExit(uname)){
					request.put("isExit", "false");
				}else{
					request.put("isExit", "true");
				}
				request.put("uname", uname);
				return "register";	
			}else{
				if(ud.isRegist(uname, upass)){
					return SUCCESS;
				}else{
					return "register";
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String login(){
		try {
			if(ud.isLogin(uname, upass)){
				session.put("userName", uname);
				session.put("userPWD", upass);
				return SUCCESS;
			}
	
			this.addFieldError("fail", "用户名或密码错误");
			return "loginFail";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String updatePwd(){
		try {
			ud.updatePWD((String)session.get("userName"), upass);
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String logout(){
		session.clear();
		return SUCCESS;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	@Override
	public void setRequest(Map<String, Object> arg0) {
		request = arg0;
	}
	@Override
	public void setSession(Map<String, Object> arg0) {
		session = arg0;
	}
	
}
