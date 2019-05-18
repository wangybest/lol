package interceptor;
import java.util.Map;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class LoginValidateInterceptor implements Interceptor {
	private static final long serialVersionUID=1L;
	@Override
	public void destroy(){
		
	}
	@Override
	public void init(){
		
	}
	@Override
	public String intercept(ActionInvocation arg0) throws Exception{
		ActionContext actionContext=arg0.getInvocationContext();
		Map<String,Object>session=actionContext.getSession();
		String user=(String)session.get("userName");
		if(user!=null){
			return arg0.invoke();
		}else{
			return "nologin";
		}
	}
}
