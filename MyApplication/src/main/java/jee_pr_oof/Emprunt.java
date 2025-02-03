package jee_pr_oof;

import java.sql.Date;

public class Emprunt {
	private int id;
    private String nom;
    private String cin;
    private String tel;
    private String email;
    private String produit;
    private Date dateCommand;
	public Emprunt(String nom, String cin, String tel, String email, String produit, Date dateCommand) {
		super();
		this.nom = nom;
		this.cin = cin;
		this.tel = tel;
		this.email = email;
		this.produit = produit;
		this.dateCommand = dateCommand;
	}
	public Emprunt(String nom, String cin, String tel, String email, String produit) {
		super();
		this.nom = nom;
		this.cin = cin;
		this.tel = tel;
		this.email = email;
		this.produit = produit;
		this.dateCommand = dateCommand;
	}
	public Emprunt(){} 
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getCin() {
		return cin;
	}
	public void setCin(String cin) {
		this.cin = cin;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProduit() {
		return produit;
	}
	public void setProduit(String produit) {
		this.produit = produit;
	}
	public Date getDateCommand() {
		return dateCommand;
	}
	public void setDateCommand(Date dateCommand) {
		this.dateCommand = dateCommand;
	}


 
}

