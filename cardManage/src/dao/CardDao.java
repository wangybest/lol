package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import entity.Card;
public class CardDao extends BaseDao {
	public boolean add(Card card)throws Exception{
	boolean b=false;
	Connection con=getConnection();
	String sql="insert into cardinfo values(?,?,?,?,?,?,?,?)";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, card.getName());
	ps.setString(2, card.getTelephone());
	ps.setString(3, card.getEmail());
	ps.setString(4, card.getCompany());
	ps.setString(5, card.getPost());
	ps.setString(6, card.getAddress());
	ps.setString(7, card.getNewFileName());
	ps.setString(8, card.getUserName());
	int i=ps.executeUpdate();
	if(i>0)
		b=true;
	return b;

}
	public boolean update(Card card)throws Exception{
		boolean b=false;
		Connection con=getConnection();
		String sql="update cardinfo set name=?,"
                +" telephone=?,"+" email=?,"+" company=?,"+" post=?,"+" address=?";
		if(card.getNewFileName()!=null)
		{
			sql=sql+", logo=?";
		}
		sql=sql+" where id=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, card.getName());
		ps.setString(2, card.getTelephone());
		ps.setString(3, card.getEmail());
		ps.setString(4, card.getCompany());
		ps.setString(5, card.getPost());
		ps.setString(6, card.getAddress());
		if(card.getNewFileName()!=null)
		{
			ps.setString(7, card.getNewFileName());
			ps.setString(8, card.getId());
		}
		else
		{
			ps.setString(7,card.getId());
		}
		int i=ps.executeUpdate();
		if(i>0)
			b=true;
		return b;		
	}
	public ArrayList<Card> queryAll(String userName) throws Exception
	{
		ArrayList<Card> ac=new ArrayList<Card>();
		Connection con=getConnection();
		String sql="select * from cardinfo where userName=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, userName);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			Card c=new Card();
			c.setId(rs.getString("id"));
			c.setName(rs.getString("name"));
			c.setTelephone(rs.getString("telephone"));
			c.setEmail(rs.getString("email"));
			c.setCompany(rs.getString("company"));
			c.setPost(rs.getString("post"));
			c.setAddress(rs.getString("address"));
			c.setNewFileName(rs.getString("logo"));
			ac.add(c);
		}
	
		return ac;
	}
	public ArrayList<Card> queryByPage(int pageCur,String userName) throws Exception
	{
		ArrayList<Card> ac=new ArrayList<Card>();
		Connection con=getConnection();
		String sql="select top 10* from cardinfo where userName=? and id not in(select top (?) id from cardinfo where username=?)";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, userName);
		ps.setInt(2,(pageCur-1)*10);
		ps.setString(3,userName);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			Card c=new Card();
			c.setId(rs.getString("id"));
			c.setName(rs.getString("name"));
			c.setTelephone(rs.getString("telephone"));
			c.setEmail(rs.getString("email"));
			c.setCompany(rs.getString("company"));
			c.setPost(rs.getString("post"));
			c.setAddress(rs.getString("address"));
			c.setNewFileName(rs.getString("logo"));
			ac.add(c);
		}
		return ac;
	}
	public Card selectA(String id) throws Exception
	{
		Card c=new Card();
		Connection con=getConnection();
		String sql="select * from cardinfo where id=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			c.setId(rs.getString("id"));
			c.setName(rs.getString("name"));
			c.setTelephone(rs.getString("telephone"));
			c.setEmail(rs.getString("email"));
			c.setCompany(rs.getString("company"));
			c.setPost(rs.getString("post"));
			c.setAddress(rs.getString("address"));
			c.setNewFileName(rs.getString("logo"));
		}
		return c;
	}
	public boolean delete(String id) throws Exception
	{
		boolean b=false;
		Connection con=getConnection();
		String sql="delete from cardinfo where id=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, id);
		int i=ps.executeUpdate();
		if(i>0)
			b=true;
		return b;
	}
	public boolean delete(String ids[]) throws Exception
	{
		boolean b=false;
		Connection con=getConnection();
		String sql="delete from cardinfo where id in ( ";
		for(int i=0;i<ids.length-1;i++)
		{
			sql=sql+ids[i]+",";
		}
		sql=sql+ids[ids.length-1]+")";
		PreparedStatement ps=con.prepareStatement(sql);
		int i=ps.executeUpdate();
		if(i>0)
			b=true;
		return b;
	}
}
