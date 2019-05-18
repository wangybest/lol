package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.Properties;
public class BaseDao {
	private static String driver;
	private static String url;
	private static String username;
	private static String password;
	

	public synchronized static Connection getConnection() throws Exception{
		Connection con=null;
		Properties p=new Properties();
		p.load(BaseDao.class.getClassLoader().getResourceAsStream("dao/jdbc.properties"));
		driver=p.getProperty("jdbc.driver");
		url=p.getProperty("jdbc.url");
		username=p.getProperty("jdbc.username");
		password=p.getProperty("jdbc.password");
		Class.forName(driver);
		con=DriverManager.getConnection(url,username,password);
		return con;
		}
	public static void close(ResultSet rs,PreparedStatement ps,Connection con) throws Exception{
		if(rs!=null){
			rs.close();
		}
		if(ps!=null){
			ps.close();
		}
		if(con!=null){
			con.close();
		}
	}
}
