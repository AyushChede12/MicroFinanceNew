package com.microfinance.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class GoldDirectory {
	@Id 
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	// Today's Rate
    private String karat;
    private String silverRate;
    private String goldRate;

    // Item Master
    private String itemMasterType;
    private String itemName;

    // Locker Master
    private String lockerLocation;
    private String lockerAddress;

    // Purity Master
    private String purityName;
    private String purity;
    private String itemPurityType;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getKarat() {
		return karat;
	}
	public void setKarat(String karat) {
		this.karat = karat;
	}
	public String getSilverRate() {
		return silverRate;
	}
	public void setSilverRate(String silverRate) {
		this.silverRate = silverRate;
	}
	public String getGoldRate() {
		return goldRate;
	}
	public void setGoldRate(String goldRate) {
		this.goldRate = goldRate;
	}
	public String getItemMasterType() {
		return itemMasterType;
	}
	public void setItemMasterType(String itemMasterType) {
		this.itemMasterType = itemMasterType;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getLockerLocation() {
		return lockerLocation;
	}
	public void setLockerLocation(String lockerLocation) {
		this.lockerLocation = lockerLocation;
	}
	public String getLockerAddress() {
		return lockerAddress;
	}
	public void setLockerAddress(String lockerAddress) {
		this.lockerAddress = lockerAddress;
	}
	public String getPurityName() {
		return purityName;
	}
	public void setPurityName(String purityName) {
		this.purityName = purityName;
	}
	public String getPurity() {
		return purity;
	}
	public void setPurity(String purity) {
		this.purity = purity;
	}
	public String getItemPurityType() {
		return itemPurityType;
	}
	public void setItemPurityType(String itemPurityType) {
		this.itemPurityType = itemPurityType;
	}
    
    
    

}
