package com.forest.namu.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.admin.domain.Analysis;
import com.forest.namu.admin.mapper.AnalysisMapper;

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

}
