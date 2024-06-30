-- Transaction for Blog DB

--USE Blog

--GO

--ALTER PROC AddCommentMark
--@comid AS int,
--@userid AS int,
--@mark AS int
--AS
--BEGIN
--	BEGIN TRAN CommentMark
--	INSERT INTO CommentRaiting (IdComment, IdUser, Mark)
--	VALUES(@comid, @userid, @mark)

--	IF @@ERROR != 0
--	BEGIN
--		PRINT N'Error in insert operation'
--		ROLLBACK TRAN CommentMark
--	END
--	ELSE
--	BEGIN
--		PRINT 'Insert operation OK'
--		UPDATE Comment 
--		SET Rating = (
--		SELECT CAST (SUM(Mark) AS float) / COUNT(*)
--		FROM Comment 
--		INNER JOIN CommentRaiting ON Comment.Id = CommentRaiting.IdComment
--		WHERE Comment.Id = @comid
--		)
--		WHERE Comment.Id = @comid

--		IF @@ERROR != 0
--		BEGIN
--			PRINT N'Error in update operation'
--			ROLLBACK TRAN CommentMark
--		END
--		ELSE
--		BEGIN
--			PRINT N'Update operation OK'
--			COMMIT TRAN CommentMark
--		END
--	END
--END


--EXEC AddCommentMark 2, 3, 7

-- INDEX
-- TRIGGER