package service;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.Page;
import com.alohaclass.jdbc.dto.PageInfo;

import DAO.AnnouncementDAO;
import DTO.Announcement;
import DTO.FAQ;

public class AnnouncementServiceImpl implements AnnouncementService {
	
	AnnouncementDAO annDao = new AnnouncementDAO();

	@Override
	public List<Announcement> top3Anno() {
		List<Announcement> list = null;
		
		try {
			list = annDao.top3Anno();
		} catch (Exception e) {
			System.err.println("공지사항 3개 조회 중 에러...");
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<Announcement> list() {
		List<Announcement> list = null;
		
		try {
			list = annDao.list();
			System.out.println(list);
		} catch (Exception e) {
			System.err.println("공지사항 전체 조회 중 에러...");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Announcement> listBy(Map<String, Object> fields) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageInfo<Announcement> page(String keyword, List<String> columList) {
		PageInfo<Announcement> pageInfo = null; 
		try {
			Page pageObj = new Page(1, 10);
			pageInfo = annDao.page(pageObj, keyword, columList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageInfo;
	}

	@Override
	public Announcement select(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Announcement announcement) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Announcement insertKey(Announcement announcement) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Announcement announcement) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}





}
