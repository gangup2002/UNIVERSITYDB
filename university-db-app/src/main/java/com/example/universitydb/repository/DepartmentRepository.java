package com.example.universitydb.repository;
import com.example.universitydb.model.Department; import org.springframework.data.jpa.repository.*; import org.springframework.data.repository.query.Param; import java.util.*;
public interface DepartmentRepository extends JpaRepository<Department,Long> {
 Optional<Department> findByCode(String code);
 @Query("SELECT d FROM Department d LEFT JOIN FETCH d.lecturers WHERE d.code = :code") Optional<Department> findWithLecturers(@Param("code") String code);
}
