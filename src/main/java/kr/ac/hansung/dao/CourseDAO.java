package kr.ac.hansung.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.model.Course;

@Repository
public class CourseDAO {
	private JdbcTemplate jdbcTemplateObject;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplateObject = new JdbcTemplate(dataSource);
	}

	public int getRowCount() {
		String sqlStatement = "select count(*) from course";
		return jdbcTemplateObject.queryForObject(sqlStatement, Integer.class);
	}

	// querying and returning single objects
	public Course getCourse(String subjectCode) {
		String sqlStatement = "select * from course where subjectCode=?";

		return jdbcTemplateObject.queryForObject(sqlStatement, new Object[] { subjectCode }, new CourseMapper());
	}

	// querying and returning multiple objects
	public List<Course> getCourses() {
		String sqlStatement = "select * from course";

		return jdbcTemplateObject.query(sqlStatement, new CourseMapper());
	}

	// 특정 년도 학기별 조회
	public List<Course> getCoursesDetail(int year, int semester) {
		String sqlStatement = "select * from course where year=? and semester=?";

		return jdbcTemplateObject.query(sqlStatement, new Object[] { year, semester }, new CourseMapper());
	}

	// 이수 구분별 학점 합 조회
	public int getCreditbyClassification(String classification) {
		String sqlStatement = "select sum(credit) from course where classification=?";
		
		return jdbcTemplateObject.queryForObject(sqlStatement, new Object[] { classification }, Integer.class);
	}

	public boolean insert(Course course) {
		int year = course.getYear();
		int semester = course.getSemester();
		String subjectCode = course.getSubjectCode();
		String subject = course.getSubject();
		String classification = course.getClassification();
		int credit = course.getCredit();

		String sqlStatement = "insert into "
				+ "course(year,semester,subjectCode,subject,classification,credit) values(?,?,?,?,?,?)";
		return (jdbcTemplateObject.update(sqlStatement,
				new Object[] { year, semester, subjectCode, subject, classification, credit }) == 1);
	}

	public boolean update(Course course) {

		int year = course.getYear();
		int semester = course.getSemester();
		String subjectCode = course.getSubjectCode();
		String subject = course.getSubject();
		String classification = course.getClassification();
		int credit = course.getCredit();

		String sqlStatement = "update course set year=?,semester=?,subject=?,classification=?,credit=? where subjectCode=?";
		return (jdbcTemplateObject.update(sqlStatement,
				new Object[] { year, semester, subject, classification, credit, subjectCode }) == 1);
	}

	public boolean delete(String subjectCode) {
		String sqlStatement = "delete from course where subjectCode=?";
		return (jdbcTemplateObject.update(sqlStatement, new Object[] { subjectCode }) == 1);
	}

}
