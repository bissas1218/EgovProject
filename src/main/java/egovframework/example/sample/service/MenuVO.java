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
	
	/** 뎁스 */
	private String depth;
	
	/** 메뉴순서 */
	private String menuOrder;
	
	/** 자식메뉴수 */
	private String cMenuCnt;
	
	/** 메뉴타입 */
	private String menuType;
	
	/** 타입값 */
	private String typeVal;
	
	public String getTypeVal() {
		return typeVal;
	}

	public void setTypeVal(String typeVal) {
		this.typeVal = typeVal;
	}

	public String getMenuType() {
		return menuType;
	}

	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}

	public String getcMenuCnt() {
		return cMenuCnt;
	}

	public void setcMenuCnt(String cMenuCnt) {
		this.cMenuCnt = cMenuCnt;
	}

	public String getDepth() {
		return depth;
	}

	public void setDepth(String depth) {
		this.depth = depth;
	}

	public String getMenuOrder() {
		return menuOrder;
	}

	public void setMenuOrder(String menuOrder) {
		this.menuOrder = menuOrder;
	}

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
