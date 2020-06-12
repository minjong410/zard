package loft.config;

import com.ibatis.sqlmap.client.SqlMapClient;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class SqlMapConfig extends SqlMapClientDaoSupport
{
  @Required
  @Autowired
  private void SetSqlMapClient(SqlMapClient sqlMapClient)
  {
    setSqlMapClient(sqlMapClient);
  }

  public Object insert(String id, Object aDto)
    throws SQLException
  {
    return getSqlMapClientTemplate().insert(id, aDto);
  }

  public int delete(String id, Object aDto) throws SQLException {
    return getSqlMapClientTemplate().delete(id, aDto);
  }

  public int update(String id, Object aDto) throws SQLException {
    return getSqlMapClientTemplate().update(id, aDto);
  }

  public Object queryForObject(String id, Object aDto) throws SQLException {
    return getSqlMapClientTemplate().queryForObject(id, aDto);
  }

  public List queryForList(String id, Object aDto) throws SQLException {
    return getSqlMapClientTemplate().queryForList(id, aDto);
  }
}