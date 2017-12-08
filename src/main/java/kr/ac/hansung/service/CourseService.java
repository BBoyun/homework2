package kr.ac.hansung.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.dao.CourseDAO;
import kr.ac.hansung.model.Course;


@Service
public class CourseService {

	private CourseDAO courseDao;

	@Autowired
	public void setOfferDao(CourseDAO courseDao) {
		this.courseDao = courseDao;
	}

	public List<Course> getCurrent() {
		return courseDao.getCourses();
	}

	public List<Course> getDetail(int year, int semester) {
		return courseDao.getCoursesDetail(year, semester);
	}

	public int getCredits(String classification) {
		return courseDao.getCreditbyClassification(classification);
	}

	public void insert(Course course) {
		courseDao.insert(course);
	}

}