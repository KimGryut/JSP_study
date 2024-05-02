select rownum, title, name, content, reg_date from mboard order by num desc;

-- 숫자로 정렬하면 rownum 잘 작성되는데 숫자가 아닌 것으로 정렬하면 뒤죽박죽 섞임 => 서브 쿼리 형태 권장

SELECT rownum, a.* FROM (SELECT * FROM mboard ORDER BY num desc) a;



SELECT rownum, a.* FROM (SELECT * FROM mboard ORDER BY num desc) a WHERE rownum>=1 and rownum<=10;
-- WHERE rownum>=1 and rownum<=10; 사용 시 다음 구간부터 작성 안 됨 => 서브 쿼리 형태 사용

SELECT * FROM 
(SELECT rownum rnum, a.* FROM
(SELECT * FROM mboard ORDER BY num desc) a)
WHERE rnum>=1 AND rnum <=10;