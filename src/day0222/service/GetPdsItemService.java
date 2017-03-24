package day0222.service;

import java.sql.Connection;
import java.sql.SQLException;

import day0222.connection.ConnectionProvider;
import day0222.dao.PdsItemDao;
import day0222.jdbc.JdbcUtil;
import day0222.model.PdsItem;

public class GetPdsItemService {
	
	private static GetPdsItemService instance = new GetPdsItemService();

	public static GetPdsItemService getInstance() {
		return instance;
	}

	private GetPdsItemService() {
	}

	public PdsItem getPdsItem(int id) throws PdsItemNotFoundException {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			PdsItem pdsItem = PdsItemDao.getInstance().selectById(conn, id);
			if (pdsItem == null) {
				throw new PdsItemNotFoundException("존재하지 않습니다:" + id);
			}
			return pdsItem;
		} catch (SQLException e) {
			throw new RuntimeException("DB 처리 에러 발생: " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
