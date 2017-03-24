package day0222.service;

import java.sql.Connection;
import java.sql.SQLException;

import day0222.connection.ConnectionProvider;
import day0222.dao.PdsItemDao;
import day0222.jdbc.JdbcUtil;

public class IncreaseDownloadCountService {

	private static IncreaseDownloadCountService instance = new IncreaseDownloadCountService();

	public static IncreaseDownloadCountService getInstance() {
		return instance;
	}

	private IncreaseDownloadCountService() {
	}

	public boolean increaseCount(int id) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			int updatedCount = PdsItemDao.getInstance().increaseCount(conn, id);
			return updatedCount == 0 ? false : true;
		} catch (SQLException e) {
			throw new RuntimeException("DB ó�� ���� �߻�: " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}

	}
}