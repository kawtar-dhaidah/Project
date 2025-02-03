import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RegisterDao {
	 String dburl = "jdbc:mysql://localhost:3306/sys";
	 String dbuname = "root";
	 String dbpassword = "Kawtardhaidah123*";
	 String dbdriver = "com.mysql.cj.jdbc.Driver";

	public void loadDriver(String dbDriver)
	{
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			con = DriverManager.getConnection(dburl, dbuname, dbpassword);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}


	public String insert(product prod) {
		loadDriver(dbdriver);
		Connection con;
		String result="<h1 style={background-color:red} >Les donnees ont ete entrees avec succes<h1>";
		try {
			con = DriverManager.getConnection(dburl, dbuname, dbpassword);
	

		String sql = "insert into products(product_name,price,surface,etat,operation,categorie,type_categorie)values(?,?,?,?,?,?,?)";
		
		
	
			PreparedStatement ps = con.prepareStatement(sql);
			 ps.setString(1, prod.getName());

		        ps.setFloat(2, prod.getPrix());
		        ps.setString(3, prod.getSurface());
		        ps.setString(4, prod.getEtat());
		       // ps.setInt(5, prod.getEcheance());
		        ps.setString(5, prod.getOperation());
		        ps.setString(6, prod.getCategorie());
		        ps.setString(7, prod.getTypeC());
		       // ps.setInt(8, idd);

			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result="<h1 background-color='red'> Les donnees n'ont pas ete entrees avec succes</h1>";
			e.printStackTrace();
		}
		return result;
		
 
	}
	
	public String delete(int id) {
		String reslt = null;
	try {	loadDriver(dbdriver);
		Connection con = getConnection();
		String query = "delete from products where productid=?";
		//LOAD jdbc driver
						PreparedStatement ps = con.prepareStatement(query);
						ps.setInt(1, id);

			int count = ps.executeUpdate();
			
if(count==1) {
				reslt="<h1>L'enregistrement a été supprimé avec succès</h1>";
				return reslt;
			}else {
				reslt="<h1>L'enregistrement n'a pas été supprimé avec succès</h1>";
				return reslt;
			}
		}catch(Exception cnf) {
			cnf.printStackTrace();
		}
	return reslt;
	
	}
	
	public String editservlet(int id) {
		loadDriver(dbdriver);
		Connection con = getConnection();
	
		String query = "update products set product_name = ?,price =?,surface= ?,etat = ?,operation= ?,categorie= ?,type_categorie=? where productid = ?";

			return query;
	}
			
		
		
		
	public ResultSet update(int id) {
		String reslt;ResultSet rs = null;
	try {	loadDriver(dbdriver);
		Connection con = getConnection();
		
		String query = "SELECT product_name,price,surface,etat,operation,categorie,type_categorie FROM products where productid=?";
					PreparedStatement ps = con.prepareStatement(query);
				ps.setInt(1, id);
				 rs = ps.executeQuery();
				rs.next();

}catch(Exception cnf) {
	cnf.printStackTrace();
}return rs;}
	


public ResultSet selectAll() {
	
	ResultSet rs = null;
	PreparedStatement ps;
	try {	loadDriver(dbdriver);
	Connection con = DriverManager.getConnection(dburl, dbuname, dbpassword);

	 String query = "select* from livres";
		 ps = con.prepareStatement(query);
		 rs = ps.executeQuery();
	}catch(Exception cnf) {
		cnf.printStackTrace();
	}
	return rs;
	
	
}

public ArrayList <product> getAll() {
    ArrayList <product> products = new ArrayList<>();
    try (Connection connection = getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement("select product_name from products")) {
        ResultSet rs = preparedStatement.executeQuery();

        while (rs.next()) {
            String name = rs.getString("product_name");
            float price = rs.getFloat("price");
            int echeance = rs.getInt("nbr_echeance");

            product prodt = new product(name);
            products.add(prodt);
            System.out.println(prodt);        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return products;
}

public void insertAchats() {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","Kawtardhaidah123*");
		 PreparedStatement ps=con.prepareStatement("insert into achats(name,cin,tele,email,prod,date_echeance,nextDate,price,nbr,categ,etat,idC) SELECT c.clientName,c.cin,c.telephone,c.email,c.produit,curdate(),DATE_ADD(curdate(), INTERVAL 6 MONTH) as next_date,p.price,p.nbr_echeance,p.categorie,p.etat,c.idcommandes from commandes c,products p where c.produit=p.product_name");
		 
		ps.executeUpdate();
	 } catch (Exception e) {
	        e.printStackTrace();
	    } 
}
public void DeleteAchat() {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","Kawtardhaidah123*");
		PreparedStatement ps=con.prepareStatement("delete from achats");
		ps.executeUpdate();
		
	}catch(Exception e) {
		e.printStackTrace();
	}
}

public void updateAll(int id) {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","Kawtardhaidah123*");
		 PreparedStatement ps=con.prepareStatement("update achats set nextDate=DATE_ADD(nextDate, INTERVAL 6 MONTH) ,nbr=nbr-1 WHERE idC=?");
		 ps.setInt(1,id);
		 
		ps.executeUpdate();
	 } catch (Exception e) {
	        e.printStackTrace();
	    } 
	
}

//fonction d'insertion des liegnes depend in the number of nbr echeance apres ghada n afficher hadik tabl lifiha kamlin wndir details wnbdl etat
public void insertion() {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","Kawtardhaidah123*");
		 PreparedStatement ps=con.prepareStatement("insert into versement values select idclient,productid,product_name,operation,categorie,type_categorie,nbr_echeance from products p,commande c,eche");
		 
		ps.executeUpdate();
	 } catch (Exception e) {
	        e.printStackTrace();
	    } 
}
public void RegisterPass(String email) {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","Kawtardhaidah123*");
		 PreparedStatement ps=con.prepareStatement("select* from login where email=? ");
		 ps.setString(1, email);
		 ps.executeQuery();
		 
	 } catch (Exception e) {
	        e.printStackTrace();
	    } 
	
}
public void ChangPassword(String email,String pass) {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","Kawtardhaidah123*");
		 PreparedStatement ps=con.prepareStatement("update pasword=? where email=? ");
		 ps.setString(1, pass);
		 ps.setString(2, email);
		 ps.executeUpdate();
		 
	 } catch (Exception e) {
	        e.printStackTrace();
	    } 
	
}



}
