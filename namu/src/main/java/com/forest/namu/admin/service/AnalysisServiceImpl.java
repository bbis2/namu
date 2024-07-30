package com.forest.namu.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.admin.domain.Analysis;
import com.forest.namu.admin.mapper.AnalysisMapper;
import com.forest.namu.domain.Member;

@Service
public class AnalysisServiceImpl implements AnalysisService {

	@Autowired
	private AnalysisMapper mapper;

	@Override
	public Analysis selectPageCount() throws Exception {
		Analysis dto = null;
		try {
			dto = mapper.selectPageCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<Analysis> selectDayPageCount() throws Exception {
		List<Analysis> list = null;

		try {
			list = mapper.selectDayPageCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Analysis> selectAlldayCount() throws Exception {
		List<Analysis> list = null;

		try {
			list = mapper.selectAlldayCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Analysis> selectHitpage() throws Exception {
		List<Analysis> list = null;

		try {
			list = mapper.selectHitpage();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Analysis> selectWeekPageCount() throws Exception {
		List<Analysis> list = null;

		try {
			list = mapper.selectWeekPageCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Analysis> selectMonthPageCount() throws Exception {
		List<Analysis> list = null;

		try {
			list = mapper.selectMonthPageCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public long selectSeoul() throws Exception {
		long result = 0;
		try {
			result = mapper.selectSeoul();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long selectBusan() throws Exception {
		long result = 0;
		try {
			result = mapper.selectBusan();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long selectDaegu() throws Exception {
		long result = 0;
		try {
			result = mapper.selectDaegu();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long selectGwangju() throws Exception {
		long result = 0;
		try {
			result = mapper.selectGwangju();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long selectInchoen() throws Exception {
		long result = 0;
		try {
			result = mapper.selectInchoen();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long selectDaejoen() throws Exception {
		long result = 0;
		try {
			result = mapper.selectDaejoen();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long selectUlsan() throws Exception {
		long result = 0;
		try {
			result = mapper.selectUlsan();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long selectSejong() throws Exception {
		long result = 0;
		try {
			result = mapper.selectSejong();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long selectGyeongGi() throws Exception {
		long result = 0;
		try {
			result = mapper.selectGyeongGi();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long selectGwanhwon() throws Exception {
		long result = 0;
		try {
			result = mapper.selectGwanhwon();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long selectChungbuk() throws Exception {
		long result = 0;
		try {
			result = mapper.selectChungbuk();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long selectChungnam() throws Exception {
		long result = 0;
		try {
			result = mapper.selectChungnam();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long selectJeonbuk() throws Exception {
		long result = 0;
		try {
			result = mapper.selectJeonbuk();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long selectJeonnam() throws Exception {
		long result = 0;
		try {
			result = mapper.selectJeonnam();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long selectGyeongbuk() throws Exception {
		long result = 0;
		try {
			result = mapper.selectGyeongbuk();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long selectGyeongnam() throws Exception {
		long result = 0;
		try {
			result = mapper.selectGyeongnam();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long selectJeju() throws Exception {
		long result = 0;
		try {
			result = mapper.selectJeju();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long allPoint() throws Exception {
		long result = 0;
		try {
			result = mapper.allPoint();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long totalRefund() throws Exception {
		long result = 0;
		try {
			result = mapper.totalRefund();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Analysis> sumedMoney() throws Exception {
		List<Analysis> list = null;
		try {
			list = mapper.sumedMoney();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Analysis> sumedMoneyMonth() throws Exception {
		List<Analysis> list = null;
		try {
			list = mapper.sumedMoneyMonth();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public long refundALl() throws Exception {
		long result = 0;
		try {
			result = mapper.refundALl();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long chargeAll() throws Exception {
		long result = 0;
		try {
			result = mapper.chargeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Analysis> selectUser() throws Exception {
		List<Analysis> list = null;
		try {
			list = mapper.selectUser();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Analysis> selectPoint(String userId) throws Exception {
		List<Analysis> list = null;
		try {
			list = mapper.selectPoint(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public long pointSeoul() throws Exception {
		long result = 0;
		try {
			result = mapper.pointSeoul();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long pointBusan() throws Exception {
		long result = 0;
		try {
			result = mapper.pointBusan();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long pointDaegu() throws Exception {
		long result = 0;
		try {
			result = mapper.pointDaegu();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long pointIncheon() throws Exception {
		long result = 0;
		try {
			result = mapper.pointIncheon();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long pointGwanju() throws Exception {
		long result = 0;
		try {
			result = mapper.pointGwanju();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long pointDaejeon() throws Exception {
		long result = 0;
		try {
			result = mapper.pointDaejeon();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long pointUlsan() throws Exception {
		long result = 0;
		try {
			result = mapper.pointUlsan();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long pointSejong() throws Exception {
		long result = 0;
		try {
			result = mapper.pointSejong();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long pointGyeonggi() throws Exception {
		long result = 0;
		try {
			result = mapper.pointGyeonggi();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long pointGangwon() throws Exception {
		long result = 0;
		try {
			result = mapper.pointGangwon();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long pointChungbuk() throws Exception {
		long result = 0;
		try {
			result = mapper.pointChungbuk();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long pointChungnam() throws Exception {
		long result = 0;
		try {
			result = mapper.pointChungnam();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long pointJeonbuk() throws Exception {
		long result = 0;
		try {
			result = mapper.pointJeonbuk();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long pointJeonnam() throws Exception {
		long result = 0;
		try {
			result = mapper.pointJeonnam();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long pointGyeongbuk() throws Exception {
		long result = 0;
		try {
			result = mapper.pointGyeongbuk();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long pointGyeongnam() throws Exception {
		long result = 0;
		try {
			result = mapper.pointGyeongnam();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long pointJeju() throws Exception {
		long result = 0;
		try {
			result = mapper.pointJeju();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Member> selectNewBi() throws Exception {
		List<Member> list = null;
		
		try {
			list = mapper.selectNewBi();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public long countNewBi() throws Exception {
		long result = 0;
		try {
			result = mapper.countNewBi();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long countInquiry() throws Exception {
		long result = 0;
		try {
			result = mapper.countInquiry();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long countSingo() throws Exception {
		long result = 0;
		try {
			result = mapper.countSingo();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Analysis> selectVip() throws Exception {
		List<Analysis> list = null;
		try {
			list = mapper.selectVip();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public long vipTotal() throws Exception {
		long result =0;
		try {
			result = mapper.vipTotal();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Analysis> postVip() throws Exception {
		List<Analysis> list = null;
		try {
			list = mapper.postVip();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
