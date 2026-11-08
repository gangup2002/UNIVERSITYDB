# University DB App — COSC 32133 / BECS 32263 Lab Sheet 06

Spring Boot + Spring Data JPA application for the 3NF university registration database.

## Requirements
- JDK 21 (or change `java.version` in `pom.xml` to your installed JDK)
- Maven (or use the IDE Maven wrapper/import)
- XAMPP MySQL/MariaDB or MySQL Server

## Run it
1. Start MySQL in XAMPP. Open `http://localhost/phpmyadmin`.
2. Run `sql/01-schema.sql` in the SQL tab.
3. Run `sql/02-data.sql` in the SQL tab.
4. Open this folder as a Maven project in IntelliJ IDEA / VS Code.
5. Check `src/main/resources/application.properties`. XAMPP defaults are user `root`, blank password. Change if yours differs.
6. Run `UniversityDbAppApplication.java`.
7. Visit the API URLs below. Hibernate is configured with `ddl-auto=validate`; it will check the schema and will not create/change tables.

> Run schema and sample data only once on a fresh database. Do not rerun the data script unless the tables have been emptied, or duplicate-key errors will occur.

## API checks
- `http://localhost:8080/api/students`
- `http://localhost:8080/api/students?name=sil`
- `http://localhost:8080/api/students/S001`
- `http://localhost:8080/api/students/S001/enrollments`
- `http://localhost:8080/api/courses`
- `http://localhost:8080/api/courses?minCredits=4`
- `http://localhost:8080/api/courses?department=Computer%20Science`
- `http://localhost:8080/api/courses/CS101/students`
- `http://localhost:8080/api/departments/D01/lecturers`
- `http://localhost:8080/api/enrollments?grade=A`
- `http://localhost:8080/api/reports/course-counts`

## SQL files
- `00-anomaly-demo.sql`: optional 1NF flat table + seven rows.
- `01-schema.sql`: final five-table 3NF schema.
- `02-data.sql`: sample rows.
- `03-anomaly-tests.sql`: anomaly demonstrations (run each part with care; it changes/deletes data in the flat table).
- `04-schema-violations.sql`: run each of the first eight statements separately; each is expected to fail. The final ALTER statements add and remove a temporary column.
- `05-join-check.sql`: reconstructs the original flat view.

## Important
The lab submission asks for screenshots of your own SQL execution, ER diagram, Hibernate validation and API results, plus a GitHub repository URL. These must be captured/completed by you; this project does not fabricate them. See `SUBMISSION_CHECKLIST.md`.
