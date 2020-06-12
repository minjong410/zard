package loft.service;

public interface JwtService {

	public <T> String create(String key, T data, String subject);
	
	public boolean isUsable(String jwt);
	
	public String get(String jwt,String key);
	
}