package jee_pr_oof;

import java.sql.*;
import java.util.ArrayList;

public class EmpruntDao {
    private Connection con;

    public EmpruntDao() {
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/sys";
            String username = "root";
            String password = "Kawtardhaidah123*";
            con = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public void insertEmprunt(Emprunt emprunt) {
        String sql = "INSERT INTO commandes (clientName, cin, telephone, email, produit, date_commande,date_nextVersement) VALUES (?, ?, ?, ?, ?, curdate(),DATE_ADD(curdate(), INTERVAL 6 MONTH) )";
      // String qq="insert into idcommand from  ";
        try {
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, emprunt.getNom());
            statement.setString(2, emprunt.getCin());
            statement.setString(3, emprunt.getTel());
            statement.setString(4, emprunt.getEmail());
            statement.setString(5, emprunt.getProduit());
            //statement.setDate(6, emprunt.getDateCommand());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
       String sqll = " UPDATE commandes c SET c.idprod = (SELECT p.productid FROM products p WHERE p.product_name = c.produit) ";
        try {
            PreparedStatement st = con.prepareStatement(sqll);
    
            //statement.setDate(6, emprunt.getDateCommand());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void insertAcht() {
        String sql = "insert into achats(name,cin,tele,email,prod,date_echeance,nextDate,price,nbr,categ,etat) SELECT c.clientName,c.cin,c.telephone,c.email,c.produit,curdate(),DATE_ADD(curdate(), INTERVAL 6 MONTH) as next_date,p.price,p.categorie,p.etat from commandes c,products p where c.produit=p.product_name";
        try {
            PreparedStatement statement = con.prepareStatement(sql);
    
            //statement.setDate(6, emprunt.getDateCommand());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public ArrayList<Emprunt> getEmprunts() throws SQLException {
        ArrayList<Emprunt> emprunts = new ArrayList<>();

        PreparedStatement ps = con.prepareStatement("SELECT * FROM commandes");
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Emprunt emprunt = new Emprunt(
                /**   rs.getInt("id"),
                    rs.getString("nom"),
                    rs.getString("cin"),
                    rs.getString("tel"),
                    rs.getString("email"),
                    rs.getString("produit"),
                    rs.getDate("date_commande")
                    */
            );
            emprunts.add(emprunt);
        }

        rs.close();
        ps.close();
        con.close();

        return emprunts;
    }
}
