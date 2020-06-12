package loft.model;

import java.util.List;

public class Travel {

	private int sort;
	private int total;
	private int itemId;
	private String cityId;
	private String cityName;
	private String layout;
	private String imgPath;
	private String memo;
	private String type;
	private String vertical;
	private String wide;
	private String coverYn;
	private String keyword;
	private String tilesType;
	
	private String prevCityId;
	private String prevCityName;
	private String nextCityId;
	private String nextCityName;
	
	private List<Travel> tagList;
	private Travel shuffle;
	
	
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public String getCityId() {
		return cityId;
	}
	public void setCityId(String cityId) {
		this.cityId = cityId;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getLayout() {
		return layout;
	}
	public void setLayout(String layout) {
		this.layout = layout;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public List<Travel> getTagList() {
		return tagList;
	}
	public void setTagList(List<Travel> tagList) {
		this.tagList = tagList;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getVertical() {
		return vertical;
	}
	public void setVertical(String vertical) {
		this.vertical = vertical;
	}
	public String getWide() {
		return wide;
	}
	public void setWide(String wide) {
		this.wide = wide;
	}
	public Travel getShuffle() {
		return shuffle;
	}
	public void setShuffle(Travel shuffle) {
		this.shuffle = shuffle;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getPrevCityId() {
		return prevCityId;
	}
	public void setPrevCityId(String prevCityId) {
		this.prevCityId = prevCityId;
	}
	public String getPrevCityName() {
		return prevCityName;
	}
	public void setPrevCityName(String prevCityName) {
		this.prevCityName = prevCityName;
	}
	public String getNextCityId() {
		return nextCityId;
	}
	public void setNextCityId(String nextCityId) {
		this.nextCityId = nextCityId;
	}
	public String getNextCityName() {
		return nextCityName;
	}
	public void setNextCityName(String nextCityName) {
		this.nextCityName = nextCityName;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public String getTilesType() {
		return tilesType;
	}
	public void setTilesType(String tilesType) {
		this.tilesType = tilesType;
	}
	public String getCoverYn() {
		return coverYn;
	}
	public void setCoverYn(String coverYn) {
		this.coverYn = coverYn;
	}


}