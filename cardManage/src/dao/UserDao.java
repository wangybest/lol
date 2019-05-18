package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao extends BaseDao {
	public boolean isExit(String uname) throws Exception
	{
		boolean b=false;
		Connection con=getConnection();
		String sql="select * from usertable where username=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, uname);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			b=true;
		}
		close(rs,ps,con);
		return b;
	}
	public boolean isRegist(String uname,String upass) throws Exception
	{
		boolean b=false;
		Connection con=getConnection();
		String sql="insert into usertable values(?,?)";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, uname);
		ps.setString(2,upass);
		int i=ps.executeUpdate();
		if(i>0)
		{
			b=true;
		}
		close(null,ps,con);
		return b;
	}
	public boolean isLogin(String uname,String upass)throws Exception
	{
		boolean b=false;
		Connection con=getConnection();
		String sql="select * from usertable where userName=? and password=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, uname);
		ps.setString(2, upass);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			b=true;
		}
		close(rs,ps,con);
		return b;
	}
	public boolean updatePWD(String uname,String upass) throws Exception
	{
		boolean b=false;
		Connection con=getConnection();
		String sql="update usertable set password=? where userName=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, upass);
		ps.setString(2,uname);
		int i=ps.executeUpdate();
		if(i>0)
		{
			b=true;
		}
		close(null,ps,con);
		return b;
	}
}
