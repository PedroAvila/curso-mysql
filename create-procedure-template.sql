DELIMITER &&

CREATE PROCEDURE countTotalNumberOfUsers( OUT totalCount INT )
BEGIN

    SELECT COUNT(*) INTO totalCount FROM users;

END &&

DELIMITER;