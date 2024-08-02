package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.forest.namu.common.FileManager;
import com.forest.namu.domain.Delivery;
import com.forest.namu.domain.Rider;
import com.forest.namu.mapper.DeliveryMapper;

@Service
public class DeliveryServiceImpl implements DeliveryService {

	@Autowired
	private FileManager fileManager;

	@Autowired
	private DeliveryMapper mapper;

	@Override
	public void insertDelivery(Delivery dto) throws Exception {
		try {
			mapper.insertDelivery(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<Delivery> listDelivery(Map<String, Object> map) {
		List<Delivery> list = null;
		try {
			list = mapper.listDelivery(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long selectPoint(String userId) throws Exception {
		long money = 0;

		try {
			money = mapper.selectPoint(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return money;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			mapper.updateHitCount(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public Delivery findById(long num) {
		Delivery dto = null;
		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Delivery findByPrev(Map<String, Object> map) {
		Delivery dto = null;
		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Delivery findByNext(Map<String, Object> map) {
		Delivery dto = null;
		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insertRider(Rider dto) throws Exception {
		try {
			mapper.insertRider(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void updateDelivery(Delivery dto) throws Exception {
		try {
			mapper.updateDelivery(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public long findAutowired(Delivery dto) throws Exception {
		long dstate = 0;
		try {
			dstate = mapper.findAutowired(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dstate;
	}

	@Override
	public long countOk(Delivery dto) throws Exception {
		long countOk = 0;

		try {
			countOk = mapper.countOk(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return countOk;
	}

	@Override
	public void updateAuthor(Delivery dto, String path) throws Exception {
		try {
			String saveFilename1 = fileManager.doFileUpload(dto.getSelectFile1(), path);
			String saveFilename2 = fileManager.doFileUpload(dto.getSelectFile2(), path);
			
			if (saveFilename1 != null) {
				dto.setImageFilename1(saveFilename1);
			}
			if (saveFilename2 != null) {
				dto.setImageFilename2(saveFilename2);
			}
			
			mapper.updateAuthor(dto);
			
			dto.setNum2(dto.getNum());
			mapper.riderState(dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public Delivery selectAddr(long num) throws Exception {
		Delivery dto = null;
		try {
			dto = mapper.selectAddr(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void deleteDiv(long num) throws Exception {
		try {
			mapper.deleteDiv(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
