package com.example.universitydb.repository;
import com.example.universitydb.model.Enrollment; import com.example.universitydb.dto.CourseEnrollmentCount; import org.springframework.data.jpa.repository.*; import java.util.*;
public interface EnrollmentRepository extends JpaRepository<Enrollment,Long> {
 List<Enrollment> findByStudent_StudentCode(String studentCode); List<Enrollment> findByCourse_Code(String courseCode);
 List<Enrollment> findByGrade(String grade); List<Enrollment> findByGradeIn(Collection<String> grades);
 List<Enrollment> findByStudent_StudentCodeAndGrade(String studentCode,String grade); long countByCourse_Code(String courseCode);
 @Query("SELECT c.code AS courseCode, c.title AS title, COUNT(e) AS studentCount FROM Enrollment e JOIN e.course c GROUP BY c.code,c.title ORDER BY COUNT(e) DESC,c.code")
 List<CourseEnrollmentCount> countStudentsPerCourse();
}
