package com.care.root;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired CalServiceImpl cs;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@GetMapping("index")
	public String index() {
		
		return "calendar/index";
				
	}
	
	@GetMapping("non_ajax")
	public String nonAjax() {
		System.out.println("non ajax 실행");
		return "non_ajax";
	}
	
	@GetMapping("ajax")
	public String ajax() {
		System.out.println("ajax 실행");
		return "ajax";
	}
	
	static int cnt = 0;
	@GetMapping("ajax_result")
	@ResponseBody //문자열을 돌려줄때 return 값에 문자열을 쓰기 위해서 사용
	public String ajaxResult() {
		return ++cnt + "";
	}
	@GetMapping("ajax01")
	public String ajax01() {
		return "ajax01";
	}
	@PostMapping(value="ajax_result01", 
				produces="application/json; charset=utf-8")
	@ResponseBody
	//public InfoDTO ajaxResult01(@RequestBody InfoDTO dto) {
	public Map ajaxResult01(@RequestBody Map<String, Object> dto) {
		//System.out.println("이름 : " + dto.getName());
		//System.out.println("나이 : " + dto.getAge());
		System.out.println("이름 : " + dto.get("name"));
		System.out.println("나이 : " + dto.get("age"));
		System.out.println("나이 : " + dto.get("addr"));
		//서버가서 디비 연산 후 무언처리...
		//dto.setName("서버 연선 후 이름 저장");
		//dto.setAge(2222);
		dto.put("name", "map 이름");
		dto.put("age", "map 나이");
		dto.put("addr", "map 주소");
		
		return dto;
		
	}
	@GetMapping("rest01")
	public String rest01() {
		return "rest01";
	}
	@GetMapping("getUser")
	public String getUser() {
		
		return "getUser";
	}
	
	@GetMapping(value="saveData", produces = "application/json; charset=utf-8")
	public void calendar(@RequestParam String data) {
		InfoDTO dto = new InfoDTO();
		System.out.println("data : " + data); //데이터가 잘 넘어오는 지 확인하는 디버깅 
		dto.setId("kno12350");
		try {
			List<Map<String, Object>> info = new Gson().fromJson(String.valueOf(data),
		              new TypeToken<List<Map<String, Object>>>(){}.getType());
			//String으로 가져온 이중배열을 파싱을 과정을 하기 위해서 Gson 을 사용해서 풀었습니다.
			for (Map<String, Object> plz : info) {
				System.out.println("title : " +plz.get("title"));
				System.out.println("start : " +plz.get("start"));
				System.out.println("end : " +plz.get("end"));
				
				System.out.println("-------값이 잘 들어오는지를 확인하는 디버깅");
				dto.setTitle((String) plz.get("title"));
				dto.setStart((String)plz.get("start"));
				if(plz.get("end") == null) {
					dto.setEnd("null"); //배열에서 돌아오는 값들 중에 null 이 포함 되서 넘어오는 데이터가 있기 때문에 처리
				}else {
					dto.setEnd((String)plz.get("end"));
				}
				
				System.out.println("dto id : " + dto.getId());
				System.out.println("dto title : " + dto.getTitle());
				System.out.println("dto start : " + dto.getStart());
				System.out.println("dto end : " + dto.getEnd());
				System.out.println("-------------dto 값이 잘 넘겨지는 지 확인");
				cs.insert(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();		
			}
		
		
		
	}
	
	
}
