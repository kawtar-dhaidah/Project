
public class product {
	
	String name,surface,etat,categorie,operation;
	float prix;int echeance;


	public product(String name,float prix, String surface, String etat, int echeance, String operation, String categorie) {
		super();
		this.name = name;
		this.surface = surface;
		this.etat = etat;
		this.categorie = categorie;
		this.operation = operation;
		this.prix = prix;
		this.echeance = echeance;
	}


	public product(String name, float prix, int echeance) {
		super();
		this.name = name;
		this.prix = prix;
		this.echeance = echeance;
	}
	public product(String name) {
		super();
		this.name = name;
	
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getSurface() {
		return surface;
	}


	public void setSurface(String surface) {
		this.surface = surface;
	}


	public String getEtat() {
		return etat;
	}


	public void setEtat(String etat) {
		this.etat = etat;
	}


	public String getCategorie() {
		return categorie;
	}


	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}


	public String getOperation() {
		return operation;
	}


	public void setOperation(String operation) {
		this.operation = operation;
	}


	public float getPrix() {
		return prix;
	}


	public void setPrix(float prix) {
		this.prix = prix;
	}


	public int getEcheance() {
		return echeance;
	}


	public void setEcheance(int echeance) {
		this.echeance = echeance;
	}
	

}
