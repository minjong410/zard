package loft.service.impl;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import loft.service.JwtService;

@Service
public class JwtServiceImpl implements JwtService{

	private static final String SALT =  "luvookSecret";
	
	public <T> String create(String key, T data, String subject){
		String jwt = Jwts.builder()
						 .setHeaderParam("typ", "JWT")
						 .setHeaderParam("regDate", System.currentTimeMillis())
						 .setSubject(subject)
						 .claim(key, data)
						 .setExpiration(new Date(System.currentTimeMillis() + 1 * (1000 * 60 * 60 * 24)))
						 .signWith(SignatureAlgorithm.HS256, this.generateKey())
						 .compact();
		return jwt;
	}
	
	private byte[] generateKey(){
		byte[] key = null;
		try {
			key = SALT.getBytes("UTF-8");
		} catch (Exception e) {
				e.printStackTrace();
		}
		
		return key;
	}

	public boolean isUsable(String jwt) {
		try{
			Jws<Claims> claims = Jwts.parser()
					  .setSigningKey(this.generateKey())
					  .parseClaimsJws(jwt);
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public String get(String jwt,String key) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		//String jwt = request.getHeader("Authorization");
		Jws<Claims> claims = null;
		try {
			claims = Jwts.parser()
						 .setSigningKey(SALT.getBytes("UTF-8"))
						 .parseClaimsJws(jwt);
		} catch (Exception e) {
				e.printStackTrace();
			
			/*개발환경
			Map<String,Object> testMap = new HashMap<>();
			testMap.put("memberId", 2);
			return testMap;*/
		}
		
		@SuppressWarnings("unchecked")
		//Map<String, Object> value = (LinkedHashMap<String, Object>)claims.getBody().get(key);
		String value = claims.getBody().get(key) + "";
		return value;
	}

	/*
	public int getMemberId() {
		return (int)this.get("member").get("memberId");
	}
	*/
}