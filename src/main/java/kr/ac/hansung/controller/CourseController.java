package kr.ac.hansung.controller;

import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.hansung.model.Course;
import kr.ac.hansung.service.CourseService;

@Controller
public class CourseController {

	private CourseService courseService;

	@Autowired
	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	//학기별 이수 학점 조회
	@RequestMapping("/semesterSearch")
	public String semesterSearch(Model model) {

		List<Course> courses = courseService.getCurrent();
		System.out.println("출력 = "+courses.size());
		
		model.addAttribute("courses", courses);
		return "semesterSearch";
	}

	// 이수 구분별 학점 내역
	@RequestMapping("/classificationSearch")
	public String classificationSearch(Model model) {
		int sum = 0;

		sum = courseService.getCredits("교필") 
			+ courseService.getCredits("핵교A")
			+ courseService.getCredits("핵교B")
			+ courseService.getCredits("일교") 
			+ courseService.getCredits("자율")
			+ courseService.getCredits("전지")
			+ courseService.getCredits("전기")
			+ courseService.getCredits("전선");  
		
		HashMap<String, Integer> credits = new HashMap<String, Integer>();
		credits.put("교필", courseService.getCredits("교필"));
		credits.put("핵교A", courseService.getCredits("핵교A"));
		credits.put("핵교B", courseService.getCredits("핵교B"));
		credits.put("일교", courseService.getCredits("일교"));
		credits.put("자율", courseService.getCredits("자율"));
		credits.put("전지", courseService.getCredits("전지"));
		credits.put("전기", courseService.getCredits("전기"));
		credits.put("전선", courseService.getCredits("전선"));
		
		credits.put("총학점", sum);

		model.addAttribute("credits", credits);
		return "classificationSearch";
	}

	//수강 신청하기
	@RequestMapping("/enrollment")
	public String enrollment(Model model) {
		model.addAttribute(new Course());
		return "enrollment";
	}

	
	@RequestMapping(value = "/doenrollment", method = RequestMethod.POST)
	public String enrollment(Model model, @Valid Course course,BindingResult result) {
		
		if(result.hasErrors()){
			return "enrollment";
		}
		courseService.insert(course);
		return "enrollmentComplete";
	}

	//수강 신청 조회
	@RequestMapping("/enrollmentSearch")
	public String enrollmentSearch(Model model) {

		List<Course> courses = courseService.getCurrent();
		model.addAttribute("courses", courses);

		return "enrollmentSearch";
	}

	//링크보기
	@RequestMapping("/detailView2013_1")
	public String detailView2013_1(Model model) {
		List<Course> courses = courseService.getDetail(2013, 1);
		model.addAttribute("courses", courses);
		return "detailView";
	}

	@RequestMapping("/detailView2013_2")
	public String detailView2013_2(Model model) {
		List<Course> courses = courseService.getDetail(2013, 2);
		model.addAttribute("courses", courses);
		return "detailView";
	}

	@RequestMapping("/detailView2014_1")
	public String detailView2014_1(Model model) {
		List<Course> courses = courseService.getDetail(2014, 1);
		model.addAttribute("courses", courses);
		return "detailView";
	}

	@RequestMapping("/detailView2014_2")
	public String detailView2014_2(Model model) {
		List<Course> courses = courseService.getDetail(2014, 2);
		model.addAttribute("courses", courses);
		return "detailView";
	}

	@RequestMapping("/detailView2015_1")
	public String detailView2015_1(Model model) {
		List<Course> courses = courseService.getDetail(2015, 1);
		model.addAttribute("courses", courses);
		return "detailView";
	}

	@RequestMapping("/detailView2015_2")
	public String detailView2015_2(Model model) {
		List<Course> courses = courseService.getDetail(2015, 2);
		model.addAttribute("courses", courses);
		return "detailView";
	}
	
	@RequestMapping("/detailView2016_2")
	public String detailView2016_2(Model model) {
		List<Course> courses = courseService.getDetail(2016, 2);
		model.addAttribute("courses", courses);
		return "detailView";
	}
	
	@RequestMapping("/detailView2017_1")
	public String detailView2017_1(Model model) {
		List<Course> courses = courseService.getDetail(2017, 1);
		model.addAttribute("courses", courses);
		return "detailView";
	}
	
	@RequestMapping("/detailView2017_2")
	public String detailView2017_2(Model model) {
		List<Course> courses = courseService.getDetail(2017, 2);
		model.addAttribute("courses", courses);
		return "detailView";
	}

}
