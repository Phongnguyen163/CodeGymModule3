USE quanlysinhvien;

SELECT *
FROM `subject`
WHERE credit = (SELECT MAX(credit) FROM `subject`);

SELECT s.subid,s.subname,m.mark
FROM `subject` s
         JOIN mark m ON s.subid=m.subid
WHERE mark = (SELECT MAX(mark) FROM mark);

SELECT s.studentid,s.studentname,s.address,s.phone,AVG(mark) AS "medium_score"
FROM student s
         LEFT JOIN mark m ON s.studentid=m.studentid
GROUP BY s.studentid,s.studentname
ORDER BY AVG(mark) DESC;