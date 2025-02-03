package classes;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jee_pr_oof.Emprunt;

public class Command {
	static Connection con;
	String client,CIN,telephone,email,prix,etat,id;
	String date_commande,date_retour;
	Date date_cm,n_date;
	public Command () {}
		
	public Command(String client, String cIN, String telephone, String email, String produit,Date date_cm, Date n_date, String etat) {
			super();
			this.client = client;
			CIN = cIN;
			this.telephone = telephone;
			this.email = email;
			this.prix = produit;
			this.etat = etat;
			this.date_cm = date_cm;
			this.n_date = n_date;
		}
	public Command(String id,String client, String cIN, String telephone, String livre, String prix,
		String date_emprunt, String date_retour, String etat) {
		super();
		this.id=id;
		this.client = client;
		CIN = cIN;
		this.telephone = telephone;
		this.email = livre;
		this.prix = prix;
		this.etat = etat;
		this.date_commande = date_emprunt;
		this.date_retour = date_retour;
	}
	
	public Command(String client, String cIN, String telephone, String livre, String prix,
			String date_emprunt, String date_retour, String etat) {
			super();
			this.client = client;
			CIN = cIN;
			this.telephone = telephone;
			this.email = livre;
			this.prix = prix;
			this.etat = etat;
			this.date_commande = date_emprunt;
			this.date_retour = date_retour;
		}
	

	public String getID() {
		return this.id;
	}
	public String getClient() {
		return this.client;
	}
	public String getCIN() {
		return this.CIN;
	}
	
	public String getTelehone() {
		return this.telephone;
	}
	public String getEmail() {
		return this.email;
	}
	public String getProduit() {
		return this.prix;
	}
	public String getDate_commande() {
		return this.date_commande;
	}
	public String getDate_retour() {
		return this.date_retour;
	}
	public String getEtat() {
		return this.etat;
	}
	

	public static ArrayList<Command> getAll() {
		con= connection.getCon();
		List<Command> Emprunts = new ArrayList<>();
		try {
			
			 PreparedStatement ps=con.prepareStatement("SELECT idcommandes,c.clientName,c.cin,c.telephone,c.email,c.produit,c.date_commande,c.date_nextVersement,p.etat from commandes c,products p,echeance e where c.produit=p.product_name and p.type_categorie=e.sous_categorie and e.idcategorie in (select idcategories from categories where categorie_name=p.categorie) and e.idoperation in(select idoperations from operations where product_name=p.product_name)   ");	
			 ResultSet res =ps.executeQuery();
			while(res.next()) {
				Command E=new Command(res.getString("idcommandes"),res.getString("clientName"),res.getString("cin"),res.getString("telephone"),res.getString("email"),res.getString("produit"),res.getString("date_commande"),res.getString("date_nextVersement"),res.getString("price"));
				Emprunts.add(E);
				
			}
		} catch (Exception e) {
			System.out.println("problem");
		}
		return (ArrayList<Command>) Emprunts;
		
	}
	
	public static ArrayList<Command> getEmprunt_name(String name) {
		Command.getAll();
		List<Command> Emprunts = new ArrayList<>();

		try {	con= connection.getCon();
		 PreparedStatement ps=con.prepareStatement("SELECT idcommandes,c.clientName,c.cin,c.telephone,c.email,c.produit,c.date_commande,c.date_nextVersement,p.etat from commandes c,products p,echeance e where c.produit=p.product_name and p.type_categorie=e.sous_categorie and e.idcategorie in (select idcategories from categories where categorie_name=p.categorie) and e.idoperation in(select idoperations from operations where product_name=p.product_name) and c.cin like '% "+name+"%'  ");
	
			
			ResultSet res =ps.executeQuery();
			while(res.next()) {
				Command E=new Command(res.getString("idcommandes"),res.getString("clientName"),res.getString("cin"),res.getString("telephone"),res.getString("email"),res.getString("produit"),res.getString("date_commande"),res.getString("date_nextVersement"),res.getString("price"));
				Emprunts.add(E);
				
			}
		} catch (Exception e) {
			System.out.println("problem");
		}
		return (ArrayList<Command>) Emprunts;
		
	}
	
	public static ArrayList<Command> getEmprunt_date(String date) {
		List<Command> Emprunts = new ArrayList<>();

		try {	con= connection.getCon();
		 PreparedStatement ps=con.prepareStatement("SELECT idcommandes,c.clientName,c.cin,c.telephone,c.email,c.produit,c.date_commande,c.date_nextVersement,p.etat from commandes c,products p,echeance e where c.produit=p.product_name and p.type_categorie=e.sous_categorie and e.idcategorie in (select idcategories from categories where categorie_name=p.categorie) and e.idoperation in(select idoperations from operations where product_name=p.product_name) and c.date_nextVersement like '% "+date+"%");
	
			
			ResultSet res =ps.executeQuery();
			while(res.next()) {
				Command E=new Command(res.getString("idcommandes"),res.getString("clientName"),res.getString("cin"),res.getString("telephone"),res.getString("email"),res.getString("produit"),res.getString("date_commande"),res.getString("date_nextVersement"),res.getString("etat"));
				Emprunts.add(E);
				
			}
		} catch (Exception e) {
			System.out.println("problem");
		}
		return (ArrayList<Command>) Emprunts;
		
	}
	
	
	public static ArrayList<Command> getEmprunt_id(String id) {
		con= connection.getCon();
		String req="SELECT idcommandes,clientName,cin,telephone,email,c.produit,c.date_commande,adddate(date_commande, interval 6 month) as 'date de versement suivant',p.etat FROM commandes c,products p where c.produit=p.product_name and idprod="+id;
		List<Command> Emprunts = new ArrayList<>();
		try {
			
			PreparedStatement ps =con.prepareStatement(req);
			ResultSet res =ps.executeQuery();
			while(res.next()) {
				//Emprunt E=new Emprunt(res.getString("idcommandes"),res.getString("clientName"),res.getString("cin"),res.getString("telephone"),res.getString("email"),res.getString("produit"),res.getDate("date_commande"),res.getDate("nextDate"),res.getString("etat"));
				//Emprunts.add(E);
				
			}
		} catch (Exception e) {
			System.out.println("problem");
		}
		return (ArrayList<Command>) Emprunts;
		
	}
	public static void Update_Etat(int id,String etat) {
		con= connection.getCon();
		String req="UPDATE products JOIN commandes ON products.product_name = commandes.produit SET products.etat=?  WHERE commandes.idcommandes= ? and commandes.idprod=products.productid";
		
		try {
			
			PreparedStatement ps =con.prepareStatement(req);
			ps.setString(1, etat);
			ps.setInt(2, id);
			ps.executeUpdate();
			System.out.println("update done ...");
			
		} catch (Exception e) {
			System.out.println("problem");
		}
		
		//String req="UPDATE products JOIN commandes ON products.product_name = commandes.produit SET products.etat=?  WHERE commandes.idcommandes= ?";

		
	}
	public static ArrayList<Command> getEmprunt_Retard() {
		
		con= connection.getCon();
		//String req="insert into achats(name,cin,tele,email,prod,date_echeance,nextDate,price,nbr,categ,etat) SELECT  c.clientName,c.cin,c.telephone,c.email,c.produit,c.date_commande,DATE_ADD(c.date_commande, INTERVAL 6 MONTH) as next_date,p.price,e.nbr_echeance,p.categorie,p.etat from commandes c,products p,echeance e where c.produit=p.product_name and p.type_categorie=e.sous_categorie and e.idcategorie in (select idcategories from categories where categorie_name=p.categorie) and e.idoperation in(select idoperations from operations where product_name=p.product_name) and etat LIKE 'Retard'";
        String qq="select from achats where etat like 'Retard'";

		List<Command> Emprunts = new ArrayList<>();
		try {
		PreparedStatement pre= con.prepareStatement(qq);
		ResultSet res =pre.executeQuery();
			
			//PreparedStatement ps =con.prepareStatement(req);
			//ResultSet res =ps.executeQuery();
			while(res.next()) {
				Command E=new Command(res.getString("name"),res.getString("cin"),res.getString("tele"),res.getString("email"),res.getString("prod"),res.getString("date_echeance"),res.getString("nextDate"),res.getString("etat"));
				Emprunts.add(E);
				
			}
		} catch (Exception e) {
			System.out.println("problem");
		}
		return (ArrayList<Command>) Emprunts;
		
	}
	
	public static void PremierTranche() {
		
		String query="delete from achats select * from achats where current_date() >= date_add(nextDate,interval 5 DAY) and etat='non payés'";
		
		System.out.println(query);
	}
	
	public static void AutresTranche() {
		
		String query="select * from achats where current_date() >= date_add(nextDate,interval 5 MONTH) and etat='non payés'";
		
		System.out.println(query);
	}

	public void Delete_Command(int id)
	 {
	 
	 String query="delete from commandes where productid=?";
 }
}
