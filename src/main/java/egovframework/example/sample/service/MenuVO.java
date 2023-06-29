package egovframework.example.sample.service;

public class MenuVO extends SampleDefaultVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7937724087135444948L;
	
	/** 메뉴 id */
	private String menuId;

	/** 부모 메뉴 id */
	private String pMenuId;
	
	/** 메뉴명 */
	private String menuNm;
	
	/** 레벨 */
	private String level;
	
	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getpMenuId() {
		return pMenuId;
	}

	public void setpMenuId(String pMenuId) {
		this.pMenuId = pMenuId;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getMenuNm() {
		return menuNm;
	}

	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}
	
	
	
}
