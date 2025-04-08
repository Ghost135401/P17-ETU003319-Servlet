package model;

public class Credit {
    int id;
    String libelle;
    int montant;
    String DateDebut;
    public Credit(int id, String libelle, int montant, String dateDebut, String dateFin) {
        this.id = id;
        this.libelle = libelle;
        this.montant = montant;
        DateDebut = dateDebut;
        DateFin = dateFin;
    }
    String DateFin;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getLibelle() {
        return libelle;
    }
    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }
    public int getMontant() {
        return montant;
    }
    public void setMontant(int montant) {
        this.montant = montant;
    }
    public String getDateFin() {
        return DateFin;
    }
    public void setDateFin(String dateFin) {
        DateFin = dateFin;
    }
    public String getDateDebut() {
        return DateDebut;
    }
    public void setDateDebut(String dateDebut) {
        DateDebut = dateDebut;
    }
}
